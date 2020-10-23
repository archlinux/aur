# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=sonorem
pkgver=0.2
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

source=('https://efanomars.com/sources/sonorem-0.2.tar.gz')
sha256sums=('8375a1931705582771fadc38fc86490b5bd7e0e6e138c4b267c0950d86b7f57d')

build() {
  cd "${srcdir}/sonorem"

  ./scripts/install_sonorem.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/sonorem"

  ./scripts/priv/dd_install_sonorem.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
