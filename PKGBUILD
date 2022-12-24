# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.3.4
pkgrel=1
pkgdesc="Game Backup Monitor monitors games and backs up their savegames"
url="https://mikemaximus.github.io/gbm-web/linux.html"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=('imagemagick')
depends=('mono-basic' 'sqlite' 'p7zip')
optdepends=('libnotify')
source_x86_64=("https://github.com/MikeMaximus/gbm/releases/download/v${pkgver}/GBM.v${pkgver}.64-bit.7z")
source_i686=("https://github.com/MikeMaximus/gbm/releases/download/v${pkgver}/GBM.v${pkgver}.32-bit.7z")
b2sums_x86_64=('408c7d496aecc0caf72da48171f9de8da0651ce252d3361eecc6ac4822adb8561687d7876ad2f450be9ca76257939c4d725225845b562dc1073caf9da0112788')
b2sums_i686=('1ed686be25557c543d209563d59738dd5d8bd41dd6fe86a96946cfca48ccdce497b597e168b4efe6ca0093bad9949b6c5f5e07a194a6450c01f5dbcfbb201041')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
