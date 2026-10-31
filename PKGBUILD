# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=PICSimLab
_pkgname2=${pkgname%-bin}
_date=260920
pkgver=0.9.3
pkgrel=1
pkgdesc="A realtime emulator of development boards with integrated MPLABX/avr-gdb debugger"
arch=('x86_64')
url='https://github.com/lcgamboa/picsimlab'
license=('GPL2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('gtkwave'
	 'gpsim'
	 'libgcrypt'
	 'cutecom'
	 'gedit'
	 'pulseview'
	 'glibc'
	 'dtc'
	 'gcc-libs'
	 'glib2'
         'picsim'
         'openal'
	 'pixman'
	 'libslirp'
	 'wxwidgets-common-3.0'
	 'wxwidgets-gtk3-3.0'
	 'zlib')
makedepends=('tar')
source=("${_pkgname}-${pkgver}-${_date}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_date}_Ubuntu_22.04.5_LTS_amd64.deb")
# source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/latestbuild/${_pkgname}_${pkgver}_${_date}_Ubuntu_20.04.6_LTS_amd64.deb/download")
sha256sums=('1862c3e78e99d427b854083d7ce1ab4a3e86023348150bdb695bc381f72921f1')

package() {
  # extract
  tar xvf data.tar.xz -C "${pkgdir}"

  # remove doc
  rm -rf ${pkgdir}/usr/share/doc/

  # icon
  for icon in espmsim picsimlab srtank
  do
    install -Dm644 ${pkgdir}/usr/share/${_pkgname2}/$icon.png -t ${pkgdir}/usr/share/pixmaps/
  done
}
