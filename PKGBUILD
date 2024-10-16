# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=radharc
pkgver=1.0.2
pkgrel=1
pkgdesc="Adjusts the colour temperature of according to the Sun's position"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/radharc"
license=('ISC')
depends=(libcoopgamma libred)
makedepends=(libcoopgamma libclut libred)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c208f469293632cfceda52917b8a8beadb85e18141805f653ea998a8b75aff6a)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
