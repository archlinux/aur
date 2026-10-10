# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-rediff
pkgver=1.3.1
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(8d036074339c5a59ea91f9bc4a3ab6b7de69871b5447211ad1566ce1386e39c0)

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
