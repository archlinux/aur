# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=gameoftrees
pkgver=0.77
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url=http://gameoftrees.org
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('51bcac0d7393a5620d542c23db0a25db6ebcc4ea32faa18f08d59b6567721a4611ee7dbc0fd7b718810ba5e694b91209f7e645c54328255364caff224efc2841')

build () {
	cd "got-portable-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
	make
}

package () {
	make -C "got-portable-$pkgver" DESTDIR="$pkgdir" install
}
