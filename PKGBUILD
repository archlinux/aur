# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=bluetoother
pkgver=0.14
pkgrel=1
pkgdesc="Bluetoooth adapter connectivity GUI tool"
url='https://efanomars.com/utilities/bluetoother'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

depends=('gtkmm3' 'bluez' 'bluez-libs' 'polkit')
makedepends=('cmake' 'python')
optdepends=()

#provides=("bluetoother")
#replaces=("bluetoother")
#conflicts=("bluetoother")

source=('https://efanomars.com/sources/bluetoother-0.14.tar.gz')
sha256sums=('890d6df0a8654fc29b8e2e1b05ec6cd19dac71f3a1ed65d0a8946369fc76c945')

build() {
  cd "${srcdir}/bluetoother"

  ./scripts/install_bluetoother.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/bluetoother"

  ./scripts/priv/dd_install_bluetoother.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
