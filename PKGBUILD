# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=swapper
pkgver=0.21
pkgrel=1
pkgdesc="Swap tiles to remove them"
url='https://efanomars.com/swapper'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("swapper")
#replaces=("swapper")
#conflicts=("swapper")

source=('https://efanomars.com/sources/swapper-0.21.tar.gz')
sha256sums=('41e70b8f9b1c2bcd8f0b2197bc7c9903834ba52e69f77e01bb28a88ed823ed4a')

build() {
  cd "${srcdir}/swapper"

  ./scripts/install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/swapper"

  ./scripts/priv/dd_install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
