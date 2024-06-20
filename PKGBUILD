# Maintainer: Logicle (LogicleQ) <logiclight123@yahoo.com>

pkgname="lettercell"
pkgver="1.1.0"
pkgrel="1"
pkgdesc="An esoteric programming language which looks like a jumble of letters."
arch=("x86_64" "arm")
license=("MIT")
source=("https://github.com/LogicleQ/lettercell")
sha256sums=('SKIP')

build(){
	mkdir ${srcdir}/git
	cd ${srcdir}/git
	git clone ${source}
	cd lettercell
	git reset --hard ffc209b --quiet
	make build
}

package(){
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/git/lettercell/lettercell ${pkgdir}/usr/bin/
}

