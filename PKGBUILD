# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gameoftrees
pkgver=0.75.1
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url=http://gameoftrees.org
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('2202ff8708751df6373167dfdec8dc56f6d33fcb9124ea91441da28a327aa31978e55554bcfa756255678801de6e490aff6ef9e714f6934b96a4acdbc4067ccb')

build () {
	cd "got-portable-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
	make
}

package () {
	make -C "got-portable-$pkgver" DESTDIR="$pkgdir" install
}
