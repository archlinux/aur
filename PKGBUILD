# Maintainer: L1bT0rch <L1bT0rch@proton.me>
# Contributor: Ethan Geller (ethang@valvesoftware.com)

pkgname=steamdeck-dsp
_srctag=0.99
pkgver=${_srctag#galileo-}
pkgrel=3
arch=(x86_64)
url="https://github.com/evlav/valve-hardware-audio-processing"
pkgdesc="Steamdeck Audio Processing"
license=('GPL-2.0-or-later')
depends=('pipewire' 'pipewire-audio' 'noisetorch')
makedepends=('git' 'faust' 'ladspa' 'lv2' 'boost' 'linux-api-headers' 'qt5-base')
install="${pkgname}.install"
source=("git+https://github.com/evlav/valve-hardware-audio-processing.git#tag=$_srctag")
sha512sums=('SKIP')

build() {
  cd valve-hardware-audio-processing
  make FAUSTINC="/usr/include/faust"  FAUSTLIB="/usr/share/faust"
}

package() {
  cd valve-hardware-audio-processing
  make DEST_DIR="$pkgdir/" install
}
