# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-au
pkgver=0.9
pkgrel=1
pkgdesc="Device input event library - sound playback"
url='https://efanomars.com/libraries/stmm-input-au'
arch=('x86_64' 'i686' 'aarch64')
license=('LGPL3')

depends=(
    'stmm-input>=0.16'
    'alure' 'glibmm')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-au")
#replaces=("stmm-input-au")
#conflicts=("stmm-input-au")

source=('https://efanomars.com/sources/stmm-input-au-0.9.tar.gz')
sha256sums=('57d76b2f77ae426d068dfbc7ac0b931622653717e74d58ab3b2bbce8eda798ed')

build() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-au"

  ./scripts/priv/dd_install_stmm-input-au-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

