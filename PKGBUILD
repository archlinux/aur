# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgname=villoc-git
_gitname=villoc
pkgver=0.0.19.c207275
pkgrel=1
pkgdesc="Tool for visualization of heap operations"
arch=('any')
url="https://github.com/wapiflapi/villoc"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('villoc')
conflicts=('villoc')
source=(${pkgname}::git+https://github.com/wapiflapi/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "0.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  #TODO: include pintool
  install -Dm 755 villoc.py "${pkgdir}/usr/bin/villoc"
  install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
