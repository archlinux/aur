# Maintainer: fsyy <fossy2001 web de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.2.2
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
b2sums_x86_64=('47471b70176b706dc9e14b833c6b3624b37d2e5a2bd989f527104d0468e54ae563f1ea81652ff03024870b78e9bfc85e474b1b17f9c9eba6bedbf95511e22d03')
b2sums_i686=('f551fa1a43e6bd013648c49dcdbf2efac55454afe61b4c3af4068094b32ea5ecaf858d1592599dabaaa6f9d7da613709a8689bcc287e9ae74dfb0c3d0e202420')

package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
