# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.6
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
b2sums_x86_64=('371ff9d8dfe840f85593c215d0d36ea2fc0363f39ba76a2b366aa506e2fe39f11511701457947184bc01c61d8799de422de66d40233be64c71a32e758304638f')
b2sums_i686=('0c250e9afe0418a38c84b199d20f30606e15d3c4192837d49715b4144336eec63cb61a9a518710b7db6b34667a406ca57f1f0b2f23beefc8bea713a778e950eb')

package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
