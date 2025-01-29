# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=alsause
pkgver=1.0.1
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/alsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so)
makedepends=(libsimple libasound.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(bd5ee0b604f97d505be575b813e6ff08869343fa3d166a447a7d861a001f6e033389bcfb961a080b059702757c9ef2dca3856b076067f997522e285b14bac7a5)

build () {
	cd "$srcdir/alsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/alsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
