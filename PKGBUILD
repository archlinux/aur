# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=gameoftrees
pkgver=0.84.1
pkgrel=1
pkgdesc='A version control system which prioritizes ease of use and simplicity over flexibility'
arch=(x86_64)
url="https://gameoftrees.org"
license=(custom:ISC)
conflicts=(gameoftrees-git got got-git got-bin)
depends=(ncurses util-linux-libs libbsd libevent)
makedepends=(pkgconf)
source=("$url/releases/portable/got-portable-$pkgver.tar.gz")
b2sums=('86154a2baa3543572be73eacbfc645c24f7c95bd5de14bc83da7aa0d8ef513bee8df83090c635dc2a73044149ccf9a0b769da42cd170f931bdd7d91c388ff15d')

build () {
	cd "got-portable-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin --libexecdir=/usr/lib/$pkgname
	make
}

package () {
	make -C "got-portable-$pkgver" DESTDIR="$pkgdir" install
}
