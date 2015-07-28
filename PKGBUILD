# Maintainer: Javier Tia <javier.tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam.pucik[at]gmail[dot]com>
# Author: jevv
pkgname=hpmyroom
pkgver=10.3.0.0104
pkgrel=1
pkgdesc="HP MyRoom"
url="https://www.myroom.hp.com"
arch=('x86_64' 'i686')
license=('unknown')

if [[ "$CARCH" = 'i686' ]]; then
  _debarch=i386
  sha256sums=('0b72365f6a6995711a16e83998ffaf430a6e6287de45242ea85fda79ca60638a')
  depends=('libxss' 'libpng12' 'fontconfig' 'bzip2' 'libpulse')
else
  _debarch=amd64
  sha256sums=('742060838c78125874d1fe0cd7046922a80fb40c57b3af75ebd0bf908573caf6')
  depends=('lib32-libxss' 'lib32-libpng12' 'lib32-fontconfig' 'lib32-bzip2' 'lib32-libpulse')
fi

source=(https://www.myroom.hp.com/downloadfiles/${pkgname}_v${pkgver}_${_debarch}.deb)

package() {
  ar x ${pkgname}_v${pkgver}_${_debarch}.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  chmod a-x ${pkgdir}/usr/share/hpmyroom/Resources/*
}
