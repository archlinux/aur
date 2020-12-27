# Maintainer: feherneoh <feherneoh@gmail.com>

_target=arm-eabi
_pkgdate=2019.12
_basever=7.5

pkgname=${_target}-gcc-linaro-bin
pkgver=${_basever}.0
pkgrel=1
epoch=
pkgdesc="The GNU Compiler Collection - cross compiler for ARM EABI (bare-metal) target."
arch=('x86_64')
url="http://www.linaro.org/downloads/"
license=('GPL' 'LGPL')
groups=(${_target}-toolchain-linaro-bin)
depends=()
makedepends=()
checkdepends=()
optdepends=("${_target}-newlib-linaro-bin: Standard C library optimized for embedded systems")
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs !strip staticlibs)
install=
changelog=
source=(http://releases.linaro.org/components/toolchain/binaries/${_basever}-${_pkgdate}/${_target}/gcc-linaro-${pkgver}-${_pkgdate}-x86_64_${_target}.tar.xz)
sha512sums=('2d02a59a49826291fc9f78abdf3292d8c117b7249696db28acf33062720f2c43c0a82958cc2a366bb858417b86ef5a9cd790755b1fed32d5395d8ac3e864337d')


package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/gcc-linaro-${pkgver}-${_pkgdate}-x86_64_${_target}/* ${pkgdir}/usr

	rm -f 	${pkgdir}/usr/*-manifest.txt
	rm -f 	${pkgdir}/usr/bin/runtest
	rm -f 	${pkgdir}/usr/lib/lib*
	rm -rf 	${pkgdir}/usr/include
	rm -rf 	${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale}
	rm -rf 	${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
