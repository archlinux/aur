# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=swapper
pkgver=0.32
pkgrel=1
pkgdesc="Swap tiles to remove them"
url='https://efanomars.com/games/swapper'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.32'
    'stmm-input>=0.17'
    'gtkmm3')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("swapper")
#replaces=("swapper")
#conflicts=("swapper")

source=('https://efanomars.com/sources/swapper-0.32.tar.gz')
sha256sums=('2c949f155bb6d2e0e7a5dd31a3f1f815505d58901486e4a837155505ef894f3c')

build() {
  cd "${srcdir}/swapper"

  ./scripts/install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/swapper"

  ./scripts/priv/dd_install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
