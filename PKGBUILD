# Maintainer: Farzat <a@farzat.xyz>
# Contributor: sQVe <oskargrunning@gmail.com>

_pkgname='weechat-edit'
pkgname=weechat-edit-git
pkgver=r24.ba2f678
pkgrel=2
pkgdesc='Compose weechat messages in your $EDITOR'
url='https://cgit.farzat.xyz/weechat/edit'
arch=('any')
license=('MIT')
depends=('weechat')
makedepends=('git')
provides=("$_pkgname")
source=("git+https://cgit.farzat.xyz/weechat/edit")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname#weechat-}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname#weechat-}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 edit.py "${pkgdir}/usr/share/weechat/python/edit.py"
}
