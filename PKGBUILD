# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-au
pkgver=0.8
pkgrel=1
pkgdesc="Device input event library - sound playback"
url='https://efanomars.com/libraries/stmm-input-au'
arch=('x86_64' 'i686' 'aarch64')
license=('LGPL3')

depends=(
    'stmm-input>=0.15'
    'alure' 'glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-au")
#replaces=("stmm-input-au")
#conflicts=("stmm-input-au")

source=('https://efanomars.com/sources/stmm-input-au-0.8.tar.gz')
sha256sums=('cc5ac16df60e9817ce414d65253458d30c00906bd8929e224fe3a1c0a52cdf11')

build() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/priv/dd_install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

