# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-games
pkgver=0.29
pkgrel=1
pkgdesc="C++ 2D games library"
url='https://efanomars.com/libraries/stmm-games'
arch=('x86_64' 'aarch64')
license=('LGPL3')

depends=(
    'stmm-input-au>=0.9'
    'stmm-input>=0.16'
    'gtkmm3' 'librsvg' 'libxml++2.6')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-games")
#replaces=("stmm-games")
#conflicts=("stmm-games")

source=('https://efanomars.com/sources/stmm-games-0.29.tar.gz')
sha256sums=('43618924f131ef0a4bff89cf81be559756dabb642562e3cd848c5d4975d8acea')

build() {
  cd "${srcdir}/stmm-games"

  ./scripts/install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-games"

  ./scripts/priv/dd_install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
