# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>

pkgname=hdl-dump-git
_pkgbasename=hdl-dump
pkgver=0.9.2
pkgrel=1
pkgdesc="PlayStation 2 HDLoader image dump/install utility"
arch=('x86_64')
url="https://github.com/AKuHAK/hdl-dump"
license=('GPL')
provides=($_pkgname)
conflicts=(${_pkgbasename})

source=("${pkgname}::git+https://github.com/AKuHAK/${_pkgbasename}.git")
md5sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}
	make
}

package() {
	cd ${srcdir}/${pkgname}
	mkdir -p ${pkgdir}/usr/bin
	cp hdl_dump ${pkgdir}/usr/bin/hdl-dump
}
