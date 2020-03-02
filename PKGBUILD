# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=mynes
pkgver=0.6
pkgrel=1
pkgdesc="Rolling minesweeper with islands and sonars"
url='https://www.efanomars.com/games/mynes'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("mynes")
#replaces=("mynes")
#conflicts=("mynes")

source=('https://efanomars.com/sources/mynes-0.6.tar.gz')
sha256sums=('173bd3bacb94e541aca3868c98819f50739599399ce977d7e2f0bd5abb574556')

build() {
  cd "${srcdir}/mynes"

  ./scripts/install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/mynes"

  ./scripts/priv/dd_install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
