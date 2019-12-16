Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  #仮置き
  get 'posts', to: 'posts#index'

  devise_scope :user do
    get 'users/sign_up/registration',  to: 'users/registrations#step1'
    get 'users/sign_up/sms_confirmation',  to: 'users/registrations#step2'
    get 'users/sign_up/sms_confirmed', to: 'users/registrations#step3'
  end

  #top_pageのindex画面のルーティング
  get '/top_page/index', to: 'top_page#index'

  #sign_upのindexとdone画面のルーティング
  get '/sign_up/index', to: 'sign_up#index'
  get '/sign_up/done', to: 'sign_up#done'

  #住所の登録と変更のためのルーティング
  resources :user_address,only:[:create,:update]
  get '/user_address/new', to: 'user_address#step4'

  #カード登録と変更のためのルーティング
  resources :card, only: [:create]
  get '/card/new', to: 'card#step5'

  #mypageのindex画面のルーティング
  get '/mypage/index', to: 'mypage#index'

  #取引ページ関連のルーティング（仮置き。商品購入の機能を実装時に修正の必要有り！）
  get '/transactions/buy', to: 'transactions#buy'
end
