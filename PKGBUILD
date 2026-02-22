# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=coreupdown
pkgver=1.1.1
pkgrel=1
pkgdesc="Dynamically turn all non-main CPU's on and off"
url='https://codeberg.org/maandree/coreupdown'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(77d8093cba0ec5ee53a75be2003bd0a179369c4b920eb986fc4c4471b4e9d4cb)

build () {
	cd "$srcdir/coreupdown"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/coreupdown"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" postinstall
}
