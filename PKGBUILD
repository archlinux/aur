# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=sonorem
pkgver=0.4
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

source=('https://efanomars.com/sources/sonorem-0.4.tar.gz')
sha256sums=('a1fdea5934ab3f10e81859456d76326352dc6e187d4f150a928511c605a0d7e2')

build() {
  cd "${srcdir}/sonorem"

  ./scripts/install_sonorem.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/sonorem"

  ./scripts/priv/dd_install_sonorem.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
