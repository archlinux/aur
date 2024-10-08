# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=coreupdown
pkgver=1.1
pkgrel=1
pkgdesc="Dynamically turn all non-main CPU's on and off"
url='https://codeberg.org/maandree/coreupdown'
arch=(any)
license=('custom:ISC')
depends=()
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(d35965f301c89328fddda0eef8cf9a755964613558e5eaadb581b7a4249d996d61db6f97f9851edecd15934d7edb4a3464d4dc8b5371abbdc0062619dc6a121e)

build () {
	cd "$srcdir/coreupdown"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/coreupdown"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" postinstall
}
