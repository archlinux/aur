# Maintainer: MrRedstonia <contact@mrredstonia.com>
pkgname=armbian-imager-bin
pkgver=1.2.10
pkgrel=1
pkgdesc="Utility for flashing Armbian OS images to SD cards and USB drives."
arch=('x86_64')
url="https://armbian.com/"
license=('GPL-2.0')
depends=('cairo' 'gdk-pixbuf2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
makedepends=('binutils' 'tar')
provides=('armbian-imager')
conflicts=('armbian-imager')
options=('!strip')

source=("https://github.com/armbian/imager/releases/download/v${pkgver}/Armbian.Imager_${pkgver}_amd64.deb")
sha256sums=('cde6a79a3a149cfc009ddb72e611e5525bfa4eff601988a617c19c6366de68aa')

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
