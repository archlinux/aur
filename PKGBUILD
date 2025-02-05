# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=radharc
pkgver=1.2
pkgrel=1
pkgdesc="Adjusts the colour temperature of according to the Sun's position"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/radharc"
license=('ISC')
depends=(libcoopgamma 'libred>=1.1')
makedepends=(libcoopgamma libclut 'libred>=1.1')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(7adad9384548424589e237d1249e1abacc8d2d8ae77a5c7bb26db281a1065fd4)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
