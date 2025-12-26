# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=galsause
pkgver=1.0
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/galsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so gtk2 alsause)
makedepends=(libsimple libasound.so gtk2)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(4b07c2ea672a8700f19690234c417dc4642ddb1e0fc7297b5b0087ae07c5b638)

build () {
	cd "$srcdir/galsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/galsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
