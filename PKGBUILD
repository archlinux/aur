# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.4.2
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
b2sums_x86_64=('c59de05aee914bb2e13eb268dc1bb932f81e0759a1efe2d6e751a6b291458fd0dabfcab82063392161e3a4188d2c517887410a6225ea34a6b5ec3850c6b101e0')
b2sums_i686=('8a1113fa52fc7b48ad0f8c9362e576e5caa81bd6ee550b467bde1b27b5f4668d95b655b1682c7179dcc4efd29d2d79169f6bd8d3fbd0bb15bc235f3d21dd1a11')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
