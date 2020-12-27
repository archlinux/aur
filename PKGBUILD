# Maintainer: feherneoh <feherneoh@gmail.com>

_target=aarch64-elf
_pkgdate=2019.12
_basever=7.5

pkgname=${_target}-gcc-linaro-bin
pkgver=${_basever}.0
pkgrel=1
epoch=
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 EABI (bare-metal) target."
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
sha512sums=('9909f0274190d6b7056051eb0e38f4697cddc09a71f8afc40d2d00d395776c221f5b84f8bb590b46ca2993e2ad69b1dfae64bfb1935512584982a7f669ed9100')


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
