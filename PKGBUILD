# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-rediff
pkgver=1.0.4
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(970e3939339ded59b08ec677a19d70f5dcd7cd86d507e7fe503f09afb623f3ee)

build () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
