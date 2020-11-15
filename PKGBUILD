# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=swapper
pkgver=0.28
pkgrel=1
pkgdesc="Swap tiles to remove them"
url='https://efanomars.com/games/swapper'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.28'
    'stmm-input>=0.16'
    'gtkmm3')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("swapper")
#replaces=("swapper")
#conflicts=("swapper")

source=('https://efanomars.com/sources/swapper-0.28.tar.gz')
sha256sums=('16bd3d5e2d55eb7e60ffdfb837f7364d9e48460208356d00349a0398194500e5')

build() {
  cd "${srcdir}/swapper"

  ./scripts/install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/swapper"

  ./scripts/priv/dd_install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
