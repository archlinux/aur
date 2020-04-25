# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=bluetoother
pkgver=0.10
pkgrel=1
pkgdesc="Bluetoooth adapter connectivity GUI tool"
url='https://efanomars.com/bluetoother'
arch=('x86_64')
license=('GPL3')

depends=('gtkmm3' 'bluez' 'bluez-libs' 'polkit')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("bluetoother")
#replaces=("bluetoother")
#conflicts=("bluetoother")

source=('https://efanomars.com/sources/bluetoother-0.10.tar.gz')
sha256sums=('f1f9de08c932920b813c6a18496400274cc84bbe5f8dbdb33e0a9969102c0499')

build() {
  cd "${srcdir}/bluetoother"

  ./scripts/install_bluetoother.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/bluetoother"

  ./scripts/priv/dd_install_bluetoother.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
