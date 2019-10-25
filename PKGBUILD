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
sha256sums=('fcf61896579152522b78d47365ecadd4c42579b1e6c2885ebbb388668d80c6ba')

build() {
  cd "${srcdir}/bluetoother"

  ./scripts/install_bluetoother.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/bluetoother"

  ./scripts/priv/dd_install_bluetoother.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
