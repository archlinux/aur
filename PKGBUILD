# Maintainer: Javier Tia <javier.tia[at]gmail[dot]com>
# Old Maintainer: Viliam Pucik <viliam.pucik[at]gmail[dot]com>
# Old Author: jevv
pkgname=hpmyroom
pkgver=10.3.0.0108
pkgrel=2
pkgdesc="HP MyRoom"
url="https://www.myroom.hp.com"
arch=('i686' 'x86_64')
license=('unknown')

depends_i686=('libxss' 'libpng12' 'fontconfig' 'bzip2' 'libpulse')
depends_x86_64=('lib32-libxss' 'lib32-libpng12' 'lib32-fontconfig' 'lib32-bzip2' 'lib32-libpulse')

source_i686=("https://www.myroom.hp.com/downloadfiles/${pkgname}_v${pkgver}_i386.deb")
source_x86_64=("https://www.myroom.hp.com/downloadfiles/${pkgname}_v${pkgver}_amd64.deb")
sha256sums_i686=('c5d119b8843d13e12960bbfaf1c115a8b1186c02f744d918fe0c542dc6572283')
sha256sums_x86_64=('c48220b51190644c8a5a6f7fbc6f87c051e5ad5d0ebdf6cd73dee0c25b34a260')

[[ "$CARCH" = "i686" ]] && _debarch='i386'
[[ "$CARCH" = "x86_64" ]] && _debarch='amd64'

package() {
  ar x ${pkgname}_v${pkgver}_${_debarch}.deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C ${pkgdir}
  chmod a-x ${pkgdir}/usr/share/applications/HP-myroom.desktop
  chmod a-x ${pkgdir}/usr/share/hpmyroom/Resources/*
}
