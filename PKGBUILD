# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-xi
pkgver=0.18
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

source=('https://efanomars.com/sources/stmm-input-xi-0.18.tar.gz')
sha256sums=('416df04807a2336756710a59991f264c5ce89d03e387225e53d27ff18264de0d')

build() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/priv/dd_install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
