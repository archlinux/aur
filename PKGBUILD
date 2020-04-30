# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-games
pkgver=0.21
pkgrel=1
pkgdesc="C++ 2D games library"
url='https://efanomars.com/stmm-games'
arch=('x86_64')
license=('LGPL3')

depends=('stmm-input-au' 'stmm-input' 'gtkmm3' 'librsvg' 'libxml++2.6')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-games")
#replaces=("stmm-games")
#conflicts=("stmm-games")

source=('https://efanomars.com/sources/stmm-games-0.21.tar.gz')
sha256sums=('8470e21a2f463a13a0b580e4d36f09daf87d8d853480227a2699fe325cf65ca7')

build() {
  cd "${srcdir}/stmm-games"

  ./scripts/install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-games"

  ./scripts/priv/dd_install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
