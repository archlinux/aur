# Maintainer: zargbell <zargbell@yandex.ru>

_target=aarch64-elf
_pkgdate=2017.11


pkgname=${_target}-gcc-linaro-bin
pkgver=7.2
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
source=(http://releases.linaro.org/components/toolchain/binaries/${pkgver}-${_pkgdate}/${_target}/gcc-linaro-${pkgver}.1-${_pkgdate}-x86_64_${_target}.tar.xz)
sha512sums=('4ee6c4f8a0c20dd79a53727d912100e9186120807d81d1dbb8fc8bd38c02d872e3f9c984f9afde9c7a60d998ae0634f6453147295f320a47268553555f5976ac')


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
