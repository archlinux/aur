# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: 1Conan <me@1conan.com>
# Contributor: hendy643 <phenderson643@gmail.com>

_target=aarch64-none-elf
pkgname=${_target}-gcc-bin
pkgver=13.3.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('x86_64' 'aarch64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
source_x86_64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_x86_64=('7fedf894040580b1db747d06ac5d4263c46e591ffe7695656d1da5accb00a159')
source_aarch64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_aarch64=('fad7d567be5c095943d42f7078ea6f9a8452062dfe151152c2ec825814d254e0')
options=('!strip' '!debug')
provides=(aarch64-none-elf-gcc aarch64-none-elf-gcc-binutils aarch64-none-elf-gdb)
conflicts=(aarch64-none-elf-toolchain aarch64-none-elf-gcc aarch64-none-elf-gcc-binutils aarch64-none-elf-gdb)

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}/* ${pkgdir}/usr
  rm -f ${pkgdir}/usr/*-manifest.txt ${pkgdir}/usr/lib/bfd-plugins/libdep.so
  rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale} ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
