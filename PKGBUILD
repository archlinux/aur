# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-xi
pkgver=0.15
pkgrel=1
pkgdesc="Device input event library - xi floating keyboards"
url='https://efanomars.com/libraries/stmm-input-xi'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3' 'LGPL3')

depends=(
    'stmm-input>=0.15'
    'gtkmm3' 'libx11' 'libxi')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-xi")
#replaces=("stmm-input-xi")
#conflicts=("stmm-input-xi")

source=('https://efanomars.com/sources/stmm-input-xi-0.15.tar.gz')
sha256sums=('bee0a1bee5f8be445a42149e3239fdcbef2f44df24c6c53da1b2b8dd098f024e')

build() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/priv/dd_install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
