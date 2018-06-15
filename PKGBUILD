# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=3.1
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(7862f15e7839e0b1659bc9ffb2d1f3e5fd55c8a46f08376bbb7de93c6ad1dc7c04a3ee19c0777d3022a07a948d6331152be111b787b2c98b42f0222729e22d17)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
