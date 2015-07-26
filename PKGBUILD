# Maintainer: Javier Tia <javier.tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam.pucik[at]gmail[dot]com>
# Author: jevv
pkgname=hpmyroom
pkgver=10.1.0.0468
pkgrel=1
pkgdesc="HP MyRoom"
url="https://www.myroom.hp.com"
arch=('x86_64' 'i686')
license=('unknown')

if [[ "$CARCH" = 'i686' ]]; then
  _debarch=i386
  md5sums=('a8bc036c78c104810a2ef22c265c71e7')
  depends=('libxss' 'libpng12' 'fontconfig' 'bzip2' 'libpulse')
else
  _debarch=amd64
  md5sums=('5e314ac24fa1f0acc02923130a3dbfc7')
  depends=('lib32-libxss' 'lib32-libpng12' 'lib32-fontconfig' 'lib32-bzip2' 'lib32-libpulse')
fi

source=(https://www.myroom.hp.com/downloadfiles/${pkgname}_v${pkgver}_${_debarch}.deb)

package() {
  ar x ${pkgname}_v${pkgver}_${_debarch}.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  chmod a-x ${pkgdir}/usr/share/hpmyroom/Resources/*
}
