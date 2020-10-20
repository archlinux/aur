# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input
pkgver=0.15
pkgrel=1
pkgdesc="Device input event library"
url='https://efanomars.com/libraries/stmm-input'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3' 'LGPL3')

depends=('gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input")
#replaces=("stmm-input")
#conflicts=("stmm-input")

source=('https://efanomars.com/sources/stmm-input-0.15.tar.gz')
sha256sums=('7e7722e88f705419cff12bdce2b512bd647b6369ddc77a4a33354382dbdbef49')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
