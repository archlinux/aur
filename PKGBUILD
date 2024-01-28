# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=('cadical-pic')
makedepends=('bash')
source=("$pkgname-$pkgver.zip::$url/releases/download/cvc5-$pkgver/cvc5-Linux-static.zip")
sha256sums=('2edaeb41389e717a5952608c968879bacfbc59860df37e3a0cbbe5a8ac2d84ed')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr
	cp -r cvc5-Linux-static/* $pkgdir/usr
	rm $pkgdir/usr/lib/libcadical* $pkgdir/usr/lib/libpicpoly*
	chmod +x $pkgdir/usr/bin/cvc5
}
