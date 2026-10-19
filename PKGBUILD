# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=gcmap
pkgver=0.1
pkgrel=2
pkgdesc="GTK+ 2 character map utility"
url='https://codeberg.org/maandree/gcmap'
arch=(i686 x86_64)
license=('custom:ISC')
depends=(libsimple gtk2 libcmap libgrapheme pango)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(7a261c59e65aa48315dbfff578b8eaa4478428ade8c370bd9dc5971611f13b55)

build () {
	cd "$srcdir/gcmap"
	make PREFIX=/usr
}

package () {
	cd "$srcdir/gcmap"
	mkdir -p -- "$pkgdir/usr/share/applications/"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
