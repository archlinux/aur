# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Vincent Bidard de la Noë vincentbidarddelanoe@gmail.com
pkgname="sasm-asm-git"
pkgver="0.2"
pkgrel=1
pkgdesc="A compiler of sasm, an assembly-like language that compile to assembly."
arch=('any')
url="https://github.com/Vinz2008/Sasm"
license=('GPL')
makedepends=("git")
depends=("nasm")
sha256sums=('SKIP')
install=
changelog=
source=("sasm-asm::git+https://github.com/vinz2008/Sasm.git")
noextract=()


build() {
	echo ${srcdir}
	cd ${srcdir}/sasm-asm
	make clean -j1
	make -j1
}

check() {
	cd ${srcdir}/sasm-asm
	make test -j1
	make run_test -j1
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/sasm-asm/sasm" "${pkgdir}/usr/bin/sasm"
	chmod a+x "${pkgdir}/usr/bin/sasm"
}
