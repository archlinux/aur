# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-au
pkgver=0.7
pkgrel=1
pkgdesc="Device input event library - sound playback"
url='https://efanomars.com/libraries/stmm-input-au'
arch=('x86_64')
license=('LGPL3')

depends=(
    'stmm-input>=0.14'
    'alure' 'glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-au")
#replaces=("stmm-input-au")
#conflicts=("stmm-input-au")

source=('https://efanomars.com/sources/stmm-input-au-0.7.tar.gz')
sha256sums=('f8b775d93a88b7dd5584b021656dd64899c28c4b68e7f1e8817ebed1fc7f9d42')

build() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/priv/dd_install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

