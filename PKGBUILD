# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=9
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(9b407c40fb388b076beeb76aeb67874fc26df4bfd04bfc644d0ce027cc430fed1e360717c6b9bad7193642b479993bab856aabb375fba1f58a5bbac2c0e69130)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j all-fast PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
