# Maintainer: Mattias Andrée <`base64 -d`(bWF0dGlhcy5hbmRyZWU)@protonmail.com>

pkgname=git-rediff
pkgver=1.0.1
pkgrel=1
pkgdesc='Reduce partially resolved merge conflicts'
url='https://codeberg.org/maandree/git-rediff'
arch=(any)
license=('custom:ISC')
depends=(diffutils libsimple)
makedepends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=(45aca51a8b67c6f2669c1db3434298b2997cdff9680d9acb062ac87d8d8aba03c3230ec446f7ae9ea411126a0a4b50bb8715d68f62dbe1787a63a7db9ef1546e)

build () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/git-rediff"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
