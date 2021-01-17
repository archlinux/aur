# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input
pkgver=0.17
pkgrel=1
pkgdesc="Device input event library"
url='https://efanomars.com/libraries/stmm-input'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3' 'LGPL3')

depends=('gtkmm3')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input")
#replaces=("stmm-input")
#conflicts=("stmm-input")

source=('https://efanomars.com/sources/stmm-input-0.17.tar.gz')
sha256sums=('c705f74a19e1928ec96d913f4f8a93e6ef76acc2e1712eb60598aba09620cc2d')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
