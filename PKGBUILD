# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=coreupdown
pkgver=1.0
pkgrel=1
pkgdesc="Dynamically turn all non-main CPU's on and off"
url='https://codeberg.org/maandree/coreupdown'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(029add2223a4d7e9e4391694e967d642547610b492cb94f70aacd6de1d06cbe62e6cbbabc5d462b60d9d6ada1aad4aafb67b0c8234d0cb1c6981572a9a5abf11)

build () {
	cd "$srcdir/coreupdown"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/coreupdown"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" postinstall
}
