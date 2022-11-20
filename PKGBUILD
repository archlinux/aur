# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.3.3
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
b2sums_x86_64=('00760e480f0a24fbc4472c50674767c2fd00941d7118cc8d7585f24c2337bfed46829e25d906e1068e2646cbc3bac19d4033bd4b637f55454cec6350fcb62f4c')
b2sums_i686=('e574d058b94653599736e90ebf4517920695c2aca29454cedb19a141575a9a803e352a2ee96aa1a81c530098ddebb846acf21c312ef276efa34d4ece133a9263')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
