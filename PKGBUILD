# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=cvc5-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="An open-source automatic theorem prover for Satisfiability Modulo Theories (SMT) problems"
arch=(x86_64)
url="https://github.com/cvc5/cvc5"
license=('BSD3')
depends=('cadical')
makedepends=('bash')
source=("$pkgname-$pkgver.zip::$url/releases/download/cvc5-$pkgver/cvc5-Linux-static.zip")
sha256sums=('cf291aef67da8eaa8d425a51f67f3f72f36db8b1040655dc799b64e3d69e6086')
provides=("cvc5=$pkgver")
conflicts=('cvc5')

package() {
	mkdir -p $pkgdir/usr
	cp -r cvc5-Linux-static/* $pkgdir/usr
	rm $pkgdir/usr/lib/libcadical* $pkgdir/usr/lib/libpicpoly*
	chmod +x $pkgdir/usr/bin/cvc5
}
