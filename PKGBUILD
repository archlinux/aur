# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-au
pkgver=0.4
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

source=('https://efanomars.com/sources/stmm-input-au-0.4.tar.gz')
sha256sums=('499eb5ed1b2e7d5275d67705cd90c2bf2711f8bf3affb505a08699cf570f81c5')

build() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/priv/dd_install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

