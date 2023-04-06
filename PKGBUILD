# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.3.5.HF1
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
b2sums_x86_64=('282651d74a542ff19e651ed1ca0be2fcd4e662d0dbfe25c8912719a10fa1be174ab51ace414b074f6d08b6b089f8d94bb3c95ce11a220957a242fc500dd1473c')
b2sums_i686=('994157bdaa5e905363e9923af6c3d37c86b44f9e7a0272d8d9b0f09e447d8332ac84ea7c43a8037f056d80a83314043a04c8c94e67677fdaee840dca9c22923d')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
