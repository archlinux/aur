# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=galsause
pkgver=1.0.1
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/galsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so gtk2 alsause)
makedepends=(libsimple libasound.so gtk2)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(b771dd33922fadc3da1da4cd7ea12c4cd0dbcb026a91194f334b6de8503f538f)

build () {
	cd "$srcdir/galsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/galsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
