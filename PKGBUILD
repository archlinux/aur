# Maintainer: curlywei <dewei0724@gmail.com>

_target=arm-linux-gnueabihf
_pkgdate=2019.12
_compiler_name=gcc-linaro

pkgname=${_target}-${_compiler_name}-bin
pkgver=7.5
pkgrel=0
epoch=
pkgdesc="The GNU Compiler Collection- cross compiler for ARMv7 EABI hard float target. (Linaro)"
arch=('x86_64')
url="http://releases.linaro.org/components/toolchain/binaries"
license=('GPL' 'LGPL')
groups=(${_target}-toolchain-linaro-bin)
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("${_target}-gcc")
replaces=("${_target}-gcc")
backup=()
options=(!emptydirs !strip staticlibs)
install=
changelog=
source=(${url}/${pkgver}-${_pkgdate}/${_target}/${_compiler_name}-${pkgver}.${pkgrel}-${_pkgdate}-${arch}_${_target}.tar.xz)
sha512sums=('a216e4c1dfab7302f1c6457a07f377486144925a2ba3ecd20f17cc3d27bb62a09bbcfdc8ffcf61b9de49e7ef60bb659e1ce6a96c0bf91ef764097d216f45dde5')


package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/${_compiler_name}-${pkgver}.${pkgrel}-${_pkgdate}-${arch}_${_target}/* ${pkgdir}/usr

	rm -f 	${pkgdir}/usr/*-manifest.txt
	rm -f 	${pkgdir}/usr/bin/runtest
	rm -f 	${pkgdir}/usr/lib/lib*
	rm -rf 	${pkgdir}/usr/include
	rm -rf 	${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
