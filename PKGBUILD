# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gameoftrees
pkgver=0.78
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url=http://gameoftrees.org
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('363c19bba0b4fa29a80bc9fcd26cd69370b44894d905f3ccafc201ffcdf6d7e43b1dac74d004cb1b4ad7af07a751d3ac33160fed23fb4e7f57ec163589ae1ad1')

build () {
	cd "got-portable-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
	make
}

package () {
	make -C "got-portable-$pkgver" DESTDIR="$pkgdir" install
}
