# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alsause
pkgver=1.0.3
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/alsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so)
makedepends=(libsimple libasound.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(0841e96038461350eb7a96d30750a682b699c1b0cfb06e1c2a68fe3110d73a1c)

build () {
	cd "$srcdir/alsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/alsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
