# Maintainer: curlywei <dewei0724@gmail.com>

_target=arm-linux-gnueabihf
_pkgdate=2019.12


pkgname=${_target}-gcc-linaro-bin
pkgver=7.5
pkgrel=0
epoch=
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI hard float target."
arch=('x86_64')
url="http://www.linaro.org/downloads/"
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
source=(http://releases.linaro.org/components/toolchain/binaries/${pkgver}-${_pkgdate}/${_target}/gcc-linaro-${pkgver}.${pkgrel}-${_pkgdate}-x86_64_${_target}.tar.xz)
sha512sums=('a216e4c1dfab7302f1c6457a07f377486144925a2ba3ecd20f17cc3d27bb62a09bbcfdc8ffcf61b9de49e7ef60bb659e1ce6a96c0bf91ef764097d216f45dde5')


package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/gcc-linaro-${pkgver}.${pkgrel}-${_pkgdate}-x86_64_${_target}/* ${pkgdir}/usr

	rm -f 	${pkgdir}/usr/*-manifest.txt
	rm -f 	${pkgdir}/usr/bin/runtest
	rm -f 	${pkgdir}/usr/lib/lib*
	rm -rf 	${pkgdir}/usr/include
	rm -rf 	${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
