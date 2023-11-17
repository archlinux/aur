# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=picsimlab-bin
_pkgname=PICSimLab
_pkgname2=${pkgname%-bin}
_date=231112
pkgver=0.9.1
pkgrel=0
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
	 'wxwidgets-common'
	 'wxgtk3'
	 'zlib')
makedepends=('tar')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/latestbuild/${_pkgname}_${pkgver}_${_date}_Ubuntu_20.04.6_LTS_amd64.deb")
# source=("${_pkgname}-${pkgver}.deb::https://sourceforge.net/projects/picsim/files/latestbuild/${_pkgname}_${pkgver}_${_date}_Ubuntu_20.04.6_LTS_amd64.deb/download")
sha256sums=('fe953cfcb015f54b03b6ebd5d1a455d1e53561072ab3964d1da8f74f7f585152')

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
