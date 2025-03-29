# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: 1Conan <me@1conan.com>
# Contributor: hendy643 <phenderson643@gmail.com>

_target=aarch64-none-elf
pkgname=${_target}-gcc-bin
pkgver=14.2.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('x86_64' 'aarch64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
source_x86_64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_x86_64=('eb54c4727440d03199a6af9a6d021e77f45410cad39effce4e5a1c10a88b7f04')
source_aarch64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_aarch64=('c4f0daab43f78e0d56ec2bdad76b98a0223ce12ce7fc51a6ce82f9cc6c6dfba0')
options=('!strip' '!debug')
provides=(aarch64-none-elf-gcc aarch64-none-elf-gcc-binutils aarch64-none-elf-gdb)
conflicts=(aarch64-none-elf-toolchain aarch64-none-elf-gcc aarch64-none-elf-gcc-binutils aarch64-none-elf-gdb)

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}/* ${pkgdir}/usr
  rm -f ${pkgdir}/usr/*-manifest.txt ${pkgdir}/usr/lib/bfd-plugins/libdep.so
  rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale} ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
