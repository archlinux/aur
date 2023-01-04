pkgname=weechat-wee-most-git
pkgver=r507.f3e6d78
pkgrel=1
pkgdesc='A WeeChat plugin for Mattermost'
url='https://sr.ht/~tardypad/wee-most/'
arch=('any')
license=('GPL3')

makedepends=(
  'git'
)

source=(
  'git+https://git.sr.ht/~tardypad/wee-most'
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd wee-most
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'python-websocket-client'
    'weechat'
  )

  cd wee-most
  make DESTDIR="${pkgdir}" WEECHAT_DATA_DIR=/usr/share/weechat
}
