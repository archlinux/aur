# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=1
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(6668b308e74f679ce59e18f1e0d8527d84f906d0b732f94d2f83c73ec9ebd3183b50ff525f2381d8e2f8d1fe393956da38107c1d281a19f2373877721d1c5d90)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
