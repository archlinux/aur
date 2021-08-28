# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.9
pkgrel=1
pkgdesc="A realtime emulator of development boards with integrated MPLABX/avr-gdb debugger"
arch=('x86_64')
url='https://github.com/lcgamboa/picsimlab'
license=('GPL2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('wxgtk3'
         'picsim'
         'openal')
makedepends=('tar')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Ubuntu_20.10_amd64.deb")
# source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/v${pkgver}/${_pkgname}_${pkgver}_Ubuntu_20.10_amd64.deb/download")
sha256sums=('0091ba9e7781bb598170cc5563e5ffa55e04d371ffe444eefe6048f1c0bc1375')

package() {
  # extract
  tar xvf data.tar.xz -C "${pkgdir}"

  # remove doc
  rm -rf ${pkgdir}/usr/share/doc/

  # icon
  for icon in espmsim picsimlab srtank
  do
    install -Dm644 ${pkgdir}/usr/share/${_pkgname}/$icon.png -t ${pkgdir}/usr/share/pixmaps/
  done
}
