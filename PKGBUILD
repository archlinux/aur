# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alsause
pkgver=1.0.4
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/alsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so)
makedepends=(libsimple libasound.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8dff77e93e46bab361e5edf71e5362447cb172daf5264b931465a33f997d78c7)

build () {
	cd "$srcdir/alsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/alsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
