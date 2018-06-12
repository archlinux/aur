# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=2
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(ee6bb9a5e1f19f39e7b2b04c3c530d334402ccbb60b177eff796cdd30ae48b354d326bd6676e24d4806339d18cc3555fd05cb4071b6fd8b7c3e564c56a48c9b7)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
