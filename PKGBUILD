# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.7
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
sha256sums=('602f40099eb72872c659301c36acebc5275baf7e61d3f00aa2af0a5c5bf3b525')

package() {
  tar xvf data.tar.xz -C "${pkgdir}"

  for icon in espmsim picsimlab srtank
  do
    install -Dm644 ${pkgdir}/usr/share/${_pkgname}/$icon.png -t ${pkgdir}/usr/share/pixmaps/
  done
}
