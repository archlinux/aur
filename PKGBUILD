# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gameoftrees
pkgver=0.81
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url=http://gameoftrees.org
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('ae7e7dc319ac0c55a5786de1692fec6145069a6bdadecaae131a5abb0c4f4704549f33a8d5b1fe8efb59c2006c64c1c63d6167809b77acd37cb76f613a7a7c33')

build () {
	cd "got-portable-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
	make
}

package () {
	make -C "got-portable-$pkgver" DESTDIR="$pkgdir" install
}
