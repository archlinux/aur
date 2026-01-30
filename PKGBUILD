# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='DWARF optimization and duplicate removal tool'
pkgname=dwz
pkgver=0.16
pkgrel=1
url=https://sourceware.org/git/dwz.git
arch=(x86_64)
license=(GPL-2.0-or-later GPL-3.0-or-later)
depends=(libelf)
makedepends=(git make xxhash)
source=("${pkgname}::git+${url}#tag=dwz-${pkgver}")
sha512sums=('63951c6a65de6f218796dbd9e17a9b359a658f56d908fc142baba34de2e24551e3f1dbd6151a9a69200e37cb7586ff0adddc838339af2c15b484d3a42e461c1e')

build () {
	make -C "${pkgname}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" srcdir="$(pwd)/${pkgname}"
}

package () {
	make -C "${pkgname}" DESTDIR="${pkgdir}" srcdir="$(pwd)/${pkgname}" install
}
