# Maintainer: Tiago Porsch Dopke <tiagoporsch@icloud.com>
target=aarch64-none-linux-gnu
pkgver=12.3
pkgrel=1
pkgname=${target}-gcc-${pkgver}-bin
pkgdesc="GNU Cross Compilation Toolchain for AArch64 (GCC ${pkgver})"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
depends=(binutils)
conflicts=('aarch64-linux-gnu-gcc' 'aarch64-none-linux-gnu-gcc-9.2-bin' 'aarch64-none-linux-gnu-gcc-10.3-bin')
options=(!emptydirs !strip staticlibs)
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}.rel${pkgrel}/binrel/arm-gnu-toolchain-${pkgver}.rel${pkgrel}-x86_64-${target}.tar.xz")
md5sums=(db962c19a1737d10bcf14e18a8bc66e4)

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}.rel${pkgrel}-x86_64-${target}/* ${pkgdir}/usr

  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
