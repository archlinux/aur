# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-games
pkgver=0.25
pkgrel=1
pkgdesc="C++ 2D games library"
url='https://efanomars.com/libraries/stmm-games'
arch=('x86_64')
license=('LGPL3')

depends=(
    'stmm-input-au>=0.7'
    'stmm-input>=0.14'
    'gtkmm3' 'librsvg' 'libxml++2.6')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-games")
#replaces=("stmm-games")
#conflicts=("stmm-games")

source=('https://efanomars.com/sources/stmm-games-0.25.tar.gz')
sha256sums=('6fa5b6ae82223ad0568ea56f5cf4bd115dd2d4152015db7ae1b2dd614e07012c')

build() {
  cd "${srcdir}/stmm-games"

  ./scripts/install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-games"

  ./scripts/priv/dd_install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
