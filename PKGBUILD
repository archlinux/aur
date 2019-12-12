# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=bluetoother
pkgver=0.8
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

source=('https://efanomars.com/sources/bluetoother-0.8.tar.gz')
sha256sums=('b21570508c129dfe07dd49e407b98f0a804011d251add2109e802a527a410c7f')

build() {
  cd "${srcdir}/bluetoother"

  ./scripts/install_bluetoother.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/bluetoother"

  ./scripts/priv/dd_install_bluetoother.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
