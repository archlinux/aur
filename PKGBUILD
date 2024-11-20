# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2025.1
_year=2025
pkgrel=1
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/opensdk'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/opensdk/releases/download/v${pkgver//\./-}/cortexa9_vfpv3-roborio-academic-${_year}-x86_64-linux-gnu-Toolchain-12.1.0.tgz")
sha512sums=('c84e84f19bdc975130221d5693235d8b33fc8113f191ac1086dad2e15b1a32027e69864cfaecb3c36485ec46ebfc505ac4300f3866e793d9adf01b9b1721e6fb')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/roborio-academic/{arm-nilrt-linux-gnueabi,bin,libexec,share/gdb} $pkgdir/usr

  mkdir -p $pkgdir/usr/arm-nilrt-linux-gnueabi
  cp $srcdir/roborio-academic/toolchain-config.cmake $pkgdir/usr/frc-toolchain-config.cmake
}
