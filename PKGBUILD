# Maintainer: fsyy <fossy2001 at web dot de>
# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.4.1
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
b2sums_x86_64=('91140a40890c46d51b17abaaf7503d332f750d7791b776716e6f4fe192234201871e67fa6f59ceb8b8a764e825eb4a3a12f2070ce1d69083a33d5a117b4f38a2')
b2sums_i686=('1c1c0f470eb781a7c7aa0c15b335fdaf319eb9194b5412ddc134a849afb48223976adf5897dd685f1f44b5e714d9d43839a3b06d2d776056f9c3272456b39eff')
package() {
  #fix new lines
  sed -e $'s/\r$//' -i ${srcdir}/gbm.sh
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
