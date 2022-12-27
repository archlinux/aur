# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='DWARF optimization and duplicate removal tool'
pkgname=dwz
pkgver=0.15
pkgrel=1
url=https://sourceware.org/git/dwz.git
arch=(x86_64)
license=(GPL)
depends=(libelf)
makedepends=(git make xxhash)
source=("${pkgname}::git+${url}#tag=dwz-${pkgver}")
sha512sums=(SKIP)

build () {
	make -C "${pkgname}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package () {
	make -C "${pkgname}" DESTDIR="${pkgdir}" install
}
