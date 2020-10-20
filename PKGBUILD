# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=swapper
pkgver=0.26
pkgrel=1
pkgdesc="Swap tiles to remove them"
url='https://efanomars.com/games/swapper'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.26'
    'stmm-input>=0.15'
    'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("swapper")
#replaces=("swapper")
#conflicts=("swapper")

source=('https://efanomars.com/sources/swapper-0.26.tar.gz')
sha256sums=('38623155837e7ee4840cf532f3ae35a1be43dbe4c0dab3a1d5e8d68769d2252d')

build() {
  cd "${srcdir}/swapper"

  ./scripts/install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/swapper"

  ./scripts/priv/dd_install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
