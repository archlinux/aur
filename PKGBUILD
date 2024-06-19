# Maintainer: Logicle (LogicleQ) <logiclight123@yahoo.com>

pkgname="lettercell"
pkgver="1.0.0"
pkgrel="2"
pkgdesc="An interpreter for the LetterCell esoteric programming language."
arch=("x86_64" "arm")
license=("MIT")
source=("https://github.com/LogicleQ/lettercell")
sha256sums=('SKIP')

build(){
	mkdir ${srcdir}/git
	cd ${srcdir}/git
	git clone ${source}
	cd lettercell
	git reset --hard 8346c6b --quiet
	make build
}

package(){
	mkdir -p ${pkgdir}/usr/bin
	cp ${srcdir}/git/lettercell/lettercell ${pkgdir}/usr/bin/
}

