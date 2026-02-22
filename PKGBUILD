# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-rediff
pkgver=1.0.5
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(73c73757388344fa03d7e0d7315b24ce4e7bd9e85a3b7d48353823305cad9243)

build () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
