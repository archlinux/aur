# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: 1Conan <me@1conan.com>

_target=aarch64-none-elf
pkgname=${_target}-gcc-bin
pkgver=12.2.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
source=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-x86_64-${_target}.tar.xz)
sha256sums=('62d66e0ad7bd7f2a183d236ee301a5c73c737c886c7944aa4f39415aab528daf')

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-x86_64-${_target}/* ${pkgdir}/usr
  rm -f ${pkgdir}/usr/*-manifest.txt ${pkgdir}/usr/lib/bfd-plugins/libdep.so
  rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale} ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
