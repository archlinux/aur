# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-au
pkgver=0.6
pkgrel=1
pkgdesc="Device input event library - sound playback"
url='https://efanomars.com/stmm-input-au'
arch=('x86_64')
license=('LGPL3')

depends=('stmm-input' 'alure' 'glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-au")
#replaces=("stmm-input-au")
#conflicts=("stmm-input-au")

source=('https://efanomars.com/sources/stmm-input-au-0.6.tar.gz')
sha256sums=('8e11c8fc6736f366f92ff40fe4419483f230aa9001fd70795d863e544631d3cc')

build() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/priv/dd_install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

