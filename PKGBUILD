# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: 1Conan <me@1conan.com>

_target=aarch64-none-elf
pkgname=${_target}-gcc-bin
pkgver=11.3.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
source=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-x86_64-${_target}.tar.xz)
sha256sums=('fb9e562a90de1b3a2961b952193c1c6520872aa1482c0a5e0ab79970ec6e7690')

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-x86_64-${_target}/* ${pkgdir}/usr
  rm -f ${pkgdir}/usr/*-manifest.txt ${pkgdir}/usr/lib/bfd-plugins/libdep.so
  rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale} ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
