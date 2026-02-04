# Maintainer: MrRedstonia <contact@mrredstonia.com>
pkgname=armbian-imager-bin
pkgver=1.2.7
pkgrel=1
pkgdesc="Utility for flashing Armbian OS images to SD cards and USB drives."
arch=('x86_64')
url="https://armbian.com/"
license=('GPL2')
depends=('cairo' 'gdk-pixbuf2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('binutils' 'tar')
provides=('armbian-imager')
conflicts=('armbian-imager')
options=('!strip')

source=("https://github.com/armbian/imager/releases/download/v${pkgver}/Armbian.Imager_${pkgver}_amd64.deb")
sha256sums=('b33625b62116b556960aa4b524fecfcd627c5ebce259ee32f5a2c9a947d7a383')

prepare() {
  ar x "Armbian.Imager_${pkgver}_amd64.deb"
  
  tar -xf data.tar.*
}

package() {
  cp -a usr "${pkgdir}/"
  
  if [ -d "opt" ]; then
    cp -a opt "${pkgdir}/"
  fi
}
