# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.5
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
b2sums_x86_64=('61a0722515497ce8cf8ee63596e5d5c6124148af4365b629ecb895b2d833436a366afaa8638f848cb0937e596e11d3c0fd3bb8e5f014b85a22c83481b0fae820')
b2sums_i686=('34b0e8eb02e5276f35e8b8c3e523f6d773249f895f06073aa4feaf3c1d24bb4604ced2d973b486f8e295e4a5d9f70ad48128e82289258e165fd87afe212df01f')

package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
