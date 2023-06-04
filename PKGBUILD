# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=xxdi-git
pkgver=r4.1d4dcaf
pkgrel=1
pkgdesc="Perl script that implements vim's xxd -i mode"
arch=('any')
url="https://github.com/gregkh/xxdi"
license=('GPL')
provides=('xxd')
conflicts=('xxd')
depends=('perl-file-slurp')
options=(!emptydirs)
source=("$pkgname"::"git+https://github.com/gregkh/xxdi")
sha256sums=('SKIP')
          
pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm755 xxdi.pl \
    "$pkgdir/usr/bin/xxdi.pl"
}

# vim:set ts=2 sw=2 et:
