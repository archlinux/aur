# Maintainer: Garlicbreadwolfs <garlicbreadwolfs AT riseup DOT net>

pkgname=toyboxbinsh
pkgver=1
pkgrel=1
pkgdesc="Relink /bin/sh to toybox"
arch=('any')
license=('Unlicense')
conflicts=('busyboxbinsh' 'dashbinsh' 'zshbinsh')
depends=('toybox')
provides=('sh')
install="${pkgname}.install"
source=("${pkgname}.hook")

# For 32-bit machines
sha256sums=('78aa18a8c67c5f45103707d2deb7e1dedc5a9d2556072b193184ffe8b9b3a4b9')

# For 64-bit machines
sha512sums=('d019ea922ae5901fe541c3bf54dada3c2f94c0758bc9135541c1225e9769b5dda2368b5cd62f818101c0c3c451779be90cc603f1d59ad6ae213dace74b8d230b')

package() {
  cd "$srcdir"
	install -Dm 644 "${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
