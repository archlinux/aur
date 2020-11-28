# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.4
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
b2sums_x86_64=('cd2c9f98b0f2ba4674a48247d9ab6d78b735f70b3e2630766937b0ba8eb4603b449d9dc2f2ef5854026bd9ec8b17212ed7210deb465739929cccc2c8d3c10af7')
b2sums_i686=('bab4bb63eed1a22fa86ece9c2aa184126fd73991e08a7b90291136ce593ece055ce19ec7030391fb5fed986270b0163dbadf3e8af8c05fd77eec023283862858')

package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
