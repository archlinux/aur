# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=git-rediff
pkgver=1.0
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(3cb70f56a30cb2871a5ead02442d5b8eaa4ea6d8546b8aff2095beb6881482abfeb337277edd63940b839b55b3cade72b5f66052698c83756619d72530af7210)

build () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
