# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gameoftrees
pkgver=0.79
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url=http://gameoftrees.org
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('272044ae77912e402d71e93699ffda0222f8fdb3bb0d1ce88d7e35e1027c0ea5ef7381b6ce924e96da7785ed1b8afaf29fcb838a7258a17911fb53d3bbfcd26f')

build () {
	cd "got-portable-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
	make
}

package () {
	make -C "got-portable-$pkgver" DESTDIR="$pkgdir" install
}
