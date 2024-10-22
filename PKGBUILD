# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2024.1
_year=2024
pkgrel=3
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/opensdk'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/opensdk/releases/download/v${pkgver//\./-}/cortexa9_vfpv3-roborio-academic-${_year}-x86_64-linux-gnu-Toolchain-12.1.0.tgz")
sha512sums=('b2e9caa41fa8814181b0d088bebec9884bb08cc503634b644c117731cacfdcc1e5ed328847511d26af50dbc04a24967bf112510e70d7249b9f62d8856f1552a7')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/roborio-academic/{arm-nilrt-linux-gnueabi,bin,libexec,share/gdb} $pkgdir/usr

  mkdir -p $pkgdir/usr/arm-nilrt-linux-gnueabi
  cp $srcdir/roborio-academic/toolchain-config.cmake $pkgdir/usr/frc-toolchain-config.cmake
}
