# Maintainer: zargbell <zargbell@yandex.ru>

_target=aarch64-elf
_pkgdate=2017.08


pkgname=${_target}-gcc-linaro-bin
pkgver=7.1
pkgrel=1
epoch=
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 EABI (bare-metal) target."
arch=('x86_64')
url="http://www.linaro.org/downloads/"
license=('GPL' 'LGPL')
groups=(${_target}-linaro-toolchain-bin)
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
sha512sums=('28031d413573e3c617b29a516625fe086db9a4d1922ac78682128a5a17d5c5c6de1c93d24394c8e8b50d98bb69fb2811706515be793c64aa0bee3d75183c4b92')


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
