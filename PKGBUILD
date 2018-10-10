# Maintainer: Vincent Cheung <coolingfall@gmail.com>

_target=arm-linux-gnueabihf
_pkgdate=2018.05


pkgname=${_target}-gcc-linaro-bin
pkgver=7.3
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
sha512sums=('d9ec43d636634394fb4d7651fe6f0df08c53fe374dbb4f7ca9a7b4ba6a3a30d7caa8a3f2116bbec5ba4a0898f623213deca47039423d8e6ef4cc83d065389126')


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
