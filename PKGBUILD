# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=sonorem
pkgver=0.1
pkgrel=1
pkgdesc="Bluetoooth adapter connectivity GUI tool"
url='https://efanomars.com/utilities/sonorem'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

depends=('stmm-input' 'gtkmm3' 'sox' 'espeak' 'stmm-input-bt' 'bluez' 'bluez-libs')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("sonorem")
#replaces=("sonorem")
#conflicts=("sonorem")

source=('https://efanomars.com/sources/sonorem-0.1.tar.gz')
sha256sums=('291221f871125278e147dfe83d61025dcbf076bf28f074b6f5c6ad00270ebfe0')

build() {
  cd "${srcdir}/sonorem"

  ./scripts/install_sonorem.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/sonorem"

  ./scripts/priv/dd_install_sonorem.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
