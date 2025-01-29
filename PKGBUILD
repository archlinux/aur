# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alsause
pkgver=1.0.2
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/alsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so)
makedepends=(libsimple libasound.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(0d4512929323f2040a3287a1dc5d2f1e4214e70dee360f558a1d7b13fcd9f45e03f3a71491de1a18c90d780bb9caf0cccac49031bd27466f550fc2d29228af25)

build () {
	cd "$srcdir/alsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/alsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
