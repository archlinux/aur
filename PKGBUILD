# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=radharc
pkgver=1.1
pkgrel=1
pkgdesc="Adjusts the colour temperature of according to the Sun's position"
arch=(i686 x86_64)
url="https://codeberg.org/maandree/radharc"
license=('ISC')
depends=(libcoopgamma libred)
makedepends=(libcoopgamma libclut libred)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c5a20f443ec414514c1e6c0a5477613600093965811144cce09f5cd7e739852c)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}
