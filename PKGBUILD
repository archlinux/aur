# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=fsshield
pkgver=1.0
pkgrel=1
pkgdesc="Limit a new process's access to the filesystem"
url='https://codeberg.org/maandree/fsshield'
arch=(any)
license=('custom:ISC')
depends=(libsimple)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(ce3fb7d74dd2028b0ee6284fbf55a883e347b96f6a2b974e434cf49f667904b3)

build () {
	cd "$srcdir/fsshield"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/fsshield"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	make PREFIX=/usr DESTDIR="$pkgdir" post-install
}
