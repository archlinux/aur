# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.3.2
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
b2sums_x86_64=('17aae3385776f4a953e35bf1d855755b2c6d3ea5d096aea3515b3c44057a603197dd895413fc5a2955e580e3c3dbdc90eea219c6cd5f502fc9825aed5500a5fb')
b2sums_i686=('00452570719021441cbac7c8f5e82e56e82e1e12bd73a4f6f19061ee56ddd321425669f77c0350552819cf3ea256ceeb40001b0cefc6001edf0a8d58d6a3bcbe')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
