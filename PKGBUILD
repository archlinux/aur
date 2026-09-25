# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-rediff
pkgver=1.3
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(d7bfd5e78133e5c115b834e59d7d9917beaa16d7bc06af6cea42572d43b1d3e5)

build () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr
}

check () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr check
}

package () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
