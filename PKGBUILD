# Maintainer: Farzat <a@farzat.xyz>
# Contributor: sQVe <oskargrunning@gmail.com>

_pkgname='weechat-edit'
pkgname=weechat-edit-git
pkgver=r24.ba2f678
pkgrel=1
pkgdesc='Compose weechat messages in your $EDITOR'
url='https://gitlab.farzat.xyz/plugins/weechat/weechat-edit.git'
arch=('any')
license=('MIT')
depends=('weechat')
makedepends=('git')
provides=('weechat-edit')
source=('git+https://gitlab.farzat.xyz/plugins/weechat/weechat-edit.git')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 edit.py "${pkgdir}/usr/share/weechat/python/edit.py"
}
