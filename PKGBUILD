# Maintainter: Tyler Veness <calcmogul at gmail dot com>

pkgname=frc-toolchain
pkgver=2021.2
_year=2021
pkgrel=1
pkgdesc="The FIRST Robotics Competition C/C++ build system components"
arch=('x86_64')
url='https://github.com/wpilibsuite/toolchain-builder'
license=('GPL')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("https://github.com/wpilibsuite/roborio-toolchain/releases/download/v${pkgver//\./-}/FRC-${_year}-Linux-Toolchain-7.3.0.tar.gz")
sha512sums=('20763a95987d8dbecf6e169f36d111c80f1d211f24d4ec10832045d3f944a01c35ad68b21f4fdf3fddc3c92ba0ffc4a9de1d1728edb54b38d853338d8bd3dff7')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/frc${_year}/roborio/* $pkgdir/usr
  rm -r $pkgdir/usr/include
  rm -r $pkgdir/usr/share/{info,man}
}
