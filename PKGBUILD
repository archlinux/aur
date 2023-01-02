# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=${pkgname%-bin}
pkgver=0.8.11
pkgrel=2
pkgdesc="A realtime emulator of development boards with integrated MPLABX/avr-gdb debugger"
arch=('x86_64')
url='https://github.com/lcgamboa/picsimlab'
license=('GPL2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('gtkwave'
	 'gpsim'
	 'libgcrypt'
	 'cutecom'
	 'gedit'
	 'glib2'
         'picsim'
         'openal'
	 'pixman'
	 'wxgtk3'
	 'zlib')
makedepends=('tar')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Ubuntu_18.04.6_LTS_amd64.deb")
# source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/v${pkgver}/${_pkgname}_${pkgver}_Ubuntu_20.10_amd64.deb/download")
sha256sums=('8d82436a404915f714436e97281cd1b9c7e4e365c093d06b0569d1388e949899')

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
