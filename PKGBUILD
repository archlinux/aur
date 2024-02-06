# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=11
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://codeberg.org/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(536269b2453a997fb01c879978b6045be776c5893ca32bcca0a790cbaf4cd414608adedb3c6015243db7e5b4809eb750ca15ebccbd540a46c8bf959d03e8f2d7)

build () {
	cd "$srcdir/simple-icon-theme"
	make -j all-fast PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
