# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.9
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
b2sums_x86_64=('686c8aee59ea34fd39543c36254eb551077ff391dea4adef13de262515416fc7cfe38070be1a2e3b6348bdd24d9b98b78a8c05eaeec78889208bc30e377e8905')
b2sums_i686=('04172eae1e125e4fbc29b68c1cd1a550e901c7cad52556329672cd6cc850ecf308bfb90542f0f52fde5afde78b6889e9be58c9ad37457c77e59cfba97342c514')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
