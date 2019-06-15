# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=bluetoother
pkgver=0.4
pkgrel=1
pkgdesc="Bluetoooth adapter connectivity GUI tool"
url='https://www.efanomars.com/utilities/bluetoother'
arch=('x86_64')
license=('GPL3')

depends=('gtkmm' 'bluez' 'polkit')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("bluetoother")
#replaces=("bluetoother")
#conflicts=("bluetoother")

source=('git+https://gitlab.com/efanomars/bluetoother.git#commit=f2ffb7bfd804de01b163e1cf98b89d6160f97ead')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/bluetoother"

  ./scripts/install_bluetoother.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/bluetoother"

  ./scripts/priv/dd_install_bluetoother.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
