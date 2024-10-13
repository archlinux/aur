# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=PICSimLab
_pkgname2=${pkgname%-bin}
_date=241005
pkgver=0.9.2
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
source=("${_pkgname}-${pkgver}-${_date}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_date}_Ubuntu_20.04.6_LTS_amd64.deb")
# source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/latestbuild/${_pkgname}_${pkgver}_${_date}_Ubuntu_20.04.6_LTS_amd64.deb/download")
sha256sums=('b49ad448a472c794f272c79a4ffcec3a3d985d8584c76644847953f0e3323af2')

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
