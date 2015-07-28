# Maintainer: Javier Tia <javier.tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam.pucik[at]gmail[dot]com>
# Author: jevv
pkgname=hpmyroom
pkgver=10.3.0.0104
pkgrel=2
pkgdesc="HP MyRoom"
url="https://www.myroom.hp.com"
arch=('i686' 'x86_64')
license=('unknown')

depends_i686=('libxss' 'libpng12' 'fontconfig' 'bzip2' 'libpulse')
depends_x86_64=('lib32-libxss' 'lib32-libpng12' 'lib32-fontconfig' 'lib32-bzip2' 'lib32-libpulse')

source_i686=("https://www.myroom.hp.com/downloadfiles/${pkgname}_v${pkgver}_i386.deb")
source_x86_64=("https://www.myroom.hp.com/downloadfiles/${pkgname}_v${pkgver}_amd64.deb")
sha256sums_i686=('0b72365f6a6995711a16e83998ffaf430a6e6287de45242ea85fda79ca60638a')
sha256sums_x86_64=('742060838c78125874d1fe0cd7046922a80fb40c57b3af75ebd0bf908573caf6')

[[ "$CARCH" = "i686" ]] && _debarch='i386'
[[ "$CARCH" = "x86_64" ]] && _debarch='amd64'

package() {
  ar x ${pkgname}_v${pkgver}_${_debarch}.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  chmod a-x ${pkgdir}/usr/share/hpmyroom/Resources/*
}
