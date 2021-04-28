# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.7
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
b2sums_x86_64=('ac7e6815d8a490c30e16cf82abd6a883811a02b37b4dc9e7edd5bc5bba4e19db2f1f3e026a6aa629523ef2c444ca70ca8278df45023f057cb8ad77165a155942')
b2sums_i686=('3dcb6c937b8c8903074f8dc4b270ea5d986c6feae4e7f83f79516e7cda4698b8a31ed51d5e1b3fdf48119c6cb932122a74d8b52af26efffd205bed07028733ba')

package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
