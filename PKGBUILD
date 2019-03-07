# Maintainer: sQVe <oskargrunning@gmail.com>

arch=('any')
depends=('weechat')
license=('MIT')
sha512sums=('SKIP')
pkgdesc='Compose weechat messages in your $EDITOR'
pkgname=weechat-edit-git
pkgrel=1
pkgver=r8.6aface4
source=('git+https://github.com/keith/edit-weechat.git')
makedepends=('git')
url='https://github.com/keith/edit-weechat'

_gitname='edit-weechat'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 edit.py "${pkgdir}/usr/lib/weechat/python/edit.py"
}
