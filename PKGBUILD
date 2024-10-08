# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=simple-icon-theme
pkgver=12
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://codeberg.org/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(69ec5a33c489dc8420b2a3e542ff88dd025d768ba0883cfd9ef4c89bc8c7f4cfc4601cca2f949db09c88a000e5aeabd1e691b72978ea973b92b071140d6fc509)

build () {
	cd "$srcdir/simple-icon-theme"
	make -j PREFIX=/usr all-fast
}

check () {
	cd "$srcdir/simple-icon-theme"
	make check
}

package () {
	cd "$srcdir/simple-icon-theme"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
