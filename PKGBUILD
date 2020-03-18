# Maintainer: 1Conan <me@1conan.com>

_target=aarch64-none-elf
_pkgdate=2019.12
pkgname=${_target}-gcc-bin
pkgver=9.2
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 target"
arch=('x86_64')
url="https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
license=('GPL' 'LGPL')
source=(https://developer.arm.com/-/media/Files/downloads/gnu-a/${pkgver}-${_pkgdate}/binrel/gcc-arm-${pkgver}-${_pkgdate}-x86_64-${_target}.tar.xz)
md5sums=('a6019ac8c92be55a7253eacf13e64c2a')

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/gcc-arm-${pkgver}-${_pkgdate}-x86_64-${_target}/* ${pkgdir}/usr
  rm -f ${pkgdir}/usr/*-manifest.txt ${pkgdir}/usr/bin/runtest ${pkgdir}/usr/lib/lib*
  rm -rf ${pkgdir}/usr/include ${pkgdir}/usr/share/{dejagnu,doc,gcc-*,gdb,info,locale} ${pkgdir}/usr/share/man/{man1/runtest.1,man5,man7}
}
