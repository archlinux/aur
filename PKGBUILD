# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=3
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(2cca745e0ae2ebeb7be8436c5cc486769c650e8bd1401b86a106d0ecedd02501e94dee2cd214872d6d7558bc8639a800dcf2e5a96f64a5f465f042d5f505b741)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
