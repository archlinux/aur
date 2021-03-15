# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.6
pkgrel=2
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
sha256sums=('e65b26844ea69f04dfa67abeab8f7562f9c80548affaa9691b49ad3286de76a0')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"

  for icon in espmsim picsimlab srtank
  do
    install -Dm644 ${pkgdir}/usr/share/${_pkgname}/$icon.png -t ${pkgdir}/usr/share/pixmaps/
  done
}
