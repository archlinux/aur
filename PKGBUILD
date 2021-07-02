# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=weechat-edit-git
pkgver=r8.6aface4
pkgrel=2
pkgdesc='Compose weechat messages in your $EDITOR'
url='https://github.com/keith/edit-weechat'
arch=('any')
license=('MIT')
depends=('weechat')
makedepends=('git')
source=('git+https://github.com/keith/edit-weechat.git')
sha512sums=('SKIP')

_gitname='edit-weechat'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 edit.py "${pkgdir}/usr/share/weechat/python/edit.py"
}
