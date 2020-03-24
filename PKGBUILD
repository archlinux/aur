# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=7
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(01b594db48573c9e91ebb8f473d1090444f64c3709ad0e6007dd97ae9b36d32614318a49690fab345078e6000fe01a087130bea49391279caedfc17915f2109f)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j all-fast PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
