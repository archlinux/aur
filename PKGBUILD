# Maintainer: Mattias Andrée <`base64 -d`(bWF0dGlhcy5hbmRyZWU)@protonmail.com>

pkgname=alsause
pkgver=1.0
pkgrel=1
pkgdesc="Set default ALSA PCM device"
url='https://codeberg.org/maandree/alsause'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple libasound.so)
makedepends=(libsimple libasound.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(e33c60915fcd8b54c13f685ed588480a27c7ce691ae1775eab639855e03561b7b00713c8759ade5eaeb5565c9a706043c90500fb869d8752381fbdc4a175a545)

build () {
	cd "$srcdir/alsause"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/alsause"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
