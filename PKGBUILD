# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=simple-icon-theme
pkgver=6
pkgrel=1
pkgdesc='A very simple icon theme'
url='https://github.com/maandree/simple-icon-theme'
arch=(any)
license=('custom:ISC')
depends=(gtk-update-icon-cache)
makedepends=(librsvg)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(7fff2faf1f611db8dcf0854798a8d366096b72578aca2da234a4c1ea4289e1090f8dabda2a499d76744a54f31ac1092d1d282a54b284c821dfa691ac39ec2040)

build () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make -j all-fast PREFIX=/usr
}

package () {
	cd "$srcdir/simple-icon-theme-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
