# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=frc-ctrelib-cpp
pkgver=4.4.1.12
pkgrel=1
pkgdesc="Library for the  for the FRC roboRIO"
arch=(i686 x86_64)
url="http://www.ctr-electronics.com/hro.html#product_tabs_technical_resources"
license=('custom')
groups=('frc-2017')
depends=('arm-frc-linux-gnueabi-wpilib')
makedepends=()
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("http://www.ctr-electronics.com/downloads/lib/CTRE_FRCLibs_NON-WINDOWS_v${pkgver}.zip")
sha512sums=('abe152427bacf5afc870f9d8137930f456c384a84a8c1c15d07de0236918bda2acd076722c7c7e166d855573ea591cd8f754bc0fd3a95dd83877e3112f0aab16')

package() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/arm-frc-linux-gnueabi/
  cp -r cpp/include cpp/lib $pkgdir/usr/arm-frc-linux-gnueabi/

  # Avoid conflicts, badly
  rm $pkgdir/usr/arm-frc-linux-gnueabi/include/ctre/CtreCanNode.h \
     $pkgdir/usr/arm-frc-linux-gnueabi/include/ctre/ctre.h
}
