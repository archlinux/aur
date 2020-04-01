# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=8
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(181f4f529db8c828c69d0d3d0cf0a9e9c2531702700f93088289b6193b84a068553e4518c476ed6366eb07374fc2808c1a98eacdc8780fe4a1119f6f9209f378)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j all-fast PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
