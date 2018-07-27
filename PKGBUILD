# Maintainer: zargbell <zargbell@yandex.ru>

_target=aarch64-elf
_pkgdate=2018.05


pkgname=${_target}-gcc-linaro-bin
pkgver=7.3
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
sha512sums=('07f1fad77d5bb5c333d17c252d030fff20a8ffff52fc3d26a21bc73f602f50f3c7d9a619b8ba96a1bccd7d54e956f1485ca94b758bbf31f957bbfe07cb384bf0')


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
