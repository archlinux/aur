# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-au
pkgver=0.3
pkgrel=1
pkgdesc="Device input event library - sound playback"
url='https://www.efanomars.com/libraries/stmm-input-au'
arch=('x86_64')
license=('LGPL3')

depends=('stmm-input' 'alure' 'glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-au")
#replaces=("stmm-input-au")
#conflicts=("stmm-input-au")

source=('https://efanomars.com/sources/stmm-input-au-0.3.tar.gz')
sha256sums=('80de3331e4243efea950c354d38f8e5ab5858e44d093e6302dcc1d33193ff8ea')

build() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/priv/dd_install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

