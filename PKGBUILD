# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-xi
pkgver=0.17
pkgrel=1
pkgdesc="Device input event library - xi floating keyboards"
url='https://efanomars.com/libraries/stmm-input-xi'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3' 'LGPL3')

depends=(
    'stmm-input>=0.16'
    'gtkmm3' 'libx11' 'libxi')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-xi")
#replaces=("stmm-input-xi")
#conflicts=("stmm-input-xi")

source=('https://efanomars.com/sources/stmm-input-xi-0.17.tar.gz')
sha256sums=('ba3e4df967dba91ce61642222d6c5aa45ba3f00b301c023c856912374de95a2c')

build() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/priv/dd_install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
