# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=swapper
pkgver=0.13
pkgrel=1
pkgdesc="Swap tiles to remove them"
url='https://www.efanomars.com/games/swapper'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("swapper")
#replaces=("swapper")
#conflicts=("swapper")

source=('git+https://gitlab.com/efanomars/swapper.git#commit=01211816ceb939043f46d1b2e6b780c93ec3fa49')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/swapper"

  ./scripts/install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/swapper"

  ./scripts/priv/dd_install_swapper-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
