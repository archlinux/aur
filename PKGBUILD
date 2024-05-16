# Maintainer: hendy643 <hendy643@hotmail.com>

_target=aarch64-none-elf
pkgname=${_target}-toolchain
pkgver=13.2.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${arch}-${_target}.tar.xz")
sha256sums=('7fe7b8548258f079d6ce9be9144d2a10bd2bf93b551dafbf20fe7f2e44e014b8')
provides=('aarch64-none-elf-toolchain')
depends=('ncurses5-compat-libs')

package() {
  mkdir -p ${pkgdir}/usr
  _tc_dir=$(ls ${srcdir} | grep arm-gnu-toolchain | grep -v "tar.xz")
  cp -a ${srcdir}/${_tc_dir}/* ${pkgdir}/usr
  rm -f ${pkgdir}/usr/*-manifest.txt ${pkgdir}/usr/lib/bfd-plugins/libdep.so
  rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale} ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}