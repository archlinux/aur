# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=hdl-dump-git
_pkgbasename=hdl-dump
pkgver=latest.r16.gfd285d0
pkgrel=1
pkgdesc="PlayStation 2 HDLoader image dump/install utility"
arch=('x86_64')
url="https://github.com/AKuHAK/hdl-dump"
license=('GPL')
provides=(${_pkgbasename})
conflicts=(${_pkgbasename})

source=("${pkgname}::git+https://github.com/AKuHAK/${_pkgbasename}.git")
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd ${srcdir}/${pkgname}
	make
}

package() {
	cd ${srcdir}/${pkgname}
	mkdir -p ${pkgdir}/usr/bin
	cp hdl_dump ${pkgdir}/usr/bin/hdl-dump
}
