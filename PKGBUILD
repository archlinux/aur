# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=PICSimLab
#_pkgname=${pkgname%-bin}
_date=230120
pkgver=0.8.12
pkgrel=1
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
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_date}_Ubuntu_20.04.5_LTS_amd64.deb")
# source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/v${pkgver}/${_pkgname}_${pkgver}_Ubuntu_20.10_amd64.deb/download")
sha256sums=('1d7e17d63ed4f9a7d3226e298d7c6819a4d702af3677eabe05447e8f499d882d')

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
