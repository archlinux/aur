# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=bluetoother
pkgver=0.6
pkgrel=1
pkgdesc="Bluetoooth adapter connectivity GUI tool"
url='https://www.efanomars.com/utilities/bluetoother'
arch=('x86_64')
license=('GPL3')

depends=('gtkmm3' 'bluez' 'bluez-libs' 'polkit')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("bluetoother")
#replaces=("bluetoother")
#conflicts=("bluetoother")

source=('https://efanomars.com/sources/bluetoother-0.6.tar.gz')
sha256sums=('ecda48067813d3dae76dc23aad9510fc2677253a815d9fcae7679a20236f63a0')

build() {
  cd "${srcdir}/bluetoother"

  ./scripts/install_bluetoother.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/bluetoother"

  ./scripts/priv/dd_install_bluetoother.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
