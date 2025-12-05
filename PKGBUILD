# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.4.3
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
b2sums_x86_64=('9edb7dcee0d60a8acfeb6cab29235550f98f68697e3f985d3abb6d7ab9b964281a6f4b2a22a501a59ef40d8b12f3362d5ee6b20334f701a0bc638aa0069d74a6')
b2sums_i686=('15c66737e7d6803f4238902690cb98ee5db40728b68cec8bfaaad75308fda98d1fb0b9c2232ff8cb3ed6053e6389760f5ba4448857279fead5dcd24214f62317')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
