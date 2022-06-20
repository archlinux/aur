# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.3.1
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
b2sums_x86_64=('488ef0d5c22305d84a58472f97e0f3011552fdaf6e3aab11a6d8ecc8be9abf07437a17dcd10d01cdbe6ce24214983784b37b74542cec302a7f6bda4459dc4119')
b2sums_i686=('fd28a7f7a8d38589bd26331803f3ac3df550052adea2afc005f3b806597d16d8fd3bd4ac6d4665d92686b9f09f04a431079b844e0a61c6674e98cbf731d66955')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
