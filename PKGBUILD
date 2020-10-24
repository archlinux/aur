# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=sonorem
pkgver=0.3
pkgrel=1
pkgdesc="Record sound 24/7 with Raspberry Pi"
url='https://efanomars.com/utilities/sonorem'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

depends=('stmm-input' 'gtkmm3' 'sox' 'espeak' 'stmm-input-bt' 'bluez' 'bluez-libs')
makedepends=('cmake' 'python')
optdepends=()

#provides=("sonorem")
#replaces=("sonorem")
#conflicts=("sonorem")

source=('https://efanomars.com/sources/sonorem-0.3.tar.gz')
sha256sums=('3a82d1f5864feaa667736f0fbd90b9225acad7ffdeb3c8e75967a4094e4fd632')

build() {
  cd "${srcdir}/sonorem"

  ./scripts/install_sonorem.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/sonorem"

  ./scripts/priv/dd_install_sonorem.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
