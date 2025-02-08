# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=makeenv
pkgver=1.0.2
pkgrel=1
pkgdesc='Run make(1) with environment loaded from .makeenv'
url='https://codeberg.org/maandree/makeenv'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=()
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(42b434bae831b546c44f86eee97e038de150375b8b79bbe989f885db26ca27ead3d305dbe12dc0bb292ac6a4e9889e2d307a1258fa608659d07177ff8b06805f)

build () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/makeenv"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
