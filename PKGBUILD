# Maintainer: Vincent Cheung <coolingfall@gmail.com>

_target=arm-linux-gnueabihf
_pkgdate=2019.02


pkgname=${_target}-gcc-linaro-bin
pkgver=7.4
pkgrel=1
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
source=(http://releases.linaro.org/components/toolchain/binaries/${pkgver}-${_pkgdate}/${_target}/gcc-linaro-${pkgver}.1-${_pkgdate}-x86_64_${_target}.tar.xz)
sha512sums=('c93b226093606081ea71c88c3a1dea3f509553e9ed0a30578ee003e91a35711fab94496704369824855a0b46642f77cc7d0dc47cfbd51cf08773efd473a02964')


package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/gcc-linaro-${pkgver}.1-${_pkgdate}-x86_64_${_target}/* ${pkgdir}/usr

	rm -f 	${pkgdir}/usr/*-manifest.txt
	rm -f 	${pkgdir}/usr/bin/runtest
	rm -f 	${pkgdir}/usr/lib/lib*
	rm -rf 	${pkgdir}/usr/include
	rm -rf 	${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
