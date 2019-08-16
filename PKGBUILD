# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=swapper
pkgver=0.11
pkgrel=1
pkgdesc="Swap tiles to remove them"
url='https://www.efanomars.com/games/swapper'
arch=('x86_64')
license=('GPL3','LGPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("swapper")
#replaces=("swapper")
#conflicts=("swapper")

source=('git+https://gitlab.com/efanomars/swapper.git#commit=c4fe01256c9b7c80a500da0c7b161659f2d13e23')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/swapper"

  ./scripts/install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/swapper"

  ./scripts/priv/dd_install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
