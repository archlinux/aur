# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=git-rediff
pkgver=1.2
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(7273772e4256b043b21cb30c9d40e90037a509a4f45b41f3e0660aabfd773954)

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
