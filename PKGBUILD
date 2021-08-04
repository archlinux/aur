# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.8
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
b2sums_x86_64=('6ffba80eb910f521fdff5c30f2f83c8ea4257747dc72ef91e34362708041d684a6116f6aea039db3f8aae53e21369f7ce891fa9a8ffa46e3682b5ba614703c68')
b2sums_i686=('be9f21fa9ad047cc7217d721bc1c27f86548cf1592aa607234b543a6b3d840f0b4566dc8dcad4f697ae32e81c281e4318a0575dcf4137adf6fb002fd85a8b1fd')

package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
