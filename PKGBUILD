# Maintainter: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2022.1
_year=2022
pkgrel=1
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/toolchain-builder'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/roborio-toolchain/releases/download/v${pkgver//\./-}/FRC-${_year}-Linux-Toolchain-7.3.0.tar.gz")
sha512sums=('ca5775cc3eed46488566b12807367a9f5c9827e631a400d7e385593f76a5323abf1a7e025c3ccbdcf77e4fd9b7bc405c34d4055ca3b81cd5a5a7822ceca473f4')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/frc${_year}/roborio/* $pkgdir/usr
  rm -r $pkgdir/usr/include
  rm -r $pkgdir/usr/share/{info,man}
}
