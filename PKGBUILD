# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=mynes
pkgver=0.1
pkgrel=1
pkgdesc="Rolling minesweeper with islands and sonars"
url='https://www.efanomars.com/games/mynes'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("mynes")
#replaces=("mynes")
#conflicts=("mynes")

source=('git+https://gitlab.com/efanomars/mynes.git#commit=e0985980ddb214212ab3a8e1eba5cfeec29536a2')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/mynes"

  ./scripts/install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/mynes"

  ./scripts/priv/dd_install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
