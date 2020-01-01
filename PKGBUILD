# Maintainer: Andrew Chen <andrew@xortux.com>

_target=arm-none-linux-gnueabihf
_pkgver=9.2-2019.12

pkgname=${_target}-toolchain-bin
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="GNU Toolchain for the Cortex-A Family"
arch=('x86_64')
url="https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
license=('GPL' 'LGPL')
options=(!emptydirs !strip staticlibs)
source=(https://developer.arm.com/-/media/Files/downloads/gnu-a/${_pkgver}/binrel/gcc-arm-${_pkgver}-x86_64-${_target}.tar.xz)
sha256sums=('51bbaf22a4d3e7a393264c4ef1e45566701c516274dde19c4892c911caa85617')

package() {
	mkdir -p ${pkgdir}/usr
	cp -a ${srcdir}/gcc-arm-${_pkgver}-x86_64-${_target}/* ${pkgdir}/usr

	rm -f ${pkgdir}/usr/*-manifest.txt
	rm -rf ${pkgdir}/usr/lib64
	rm -rf ${pkgdir}/usr/include
	rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
	rm -rf ${pkgdir}/usr/share/man/{man5,man7}
}
