# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=mynes
pkgver=0.9
pkgrel=1
pkgdesc="Rolling minesweeper with islands and sonars"
url='https://efanomars.com/mynes'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("mynes")
#replaces=("mynes")
#conflicts=("mynes")

source=('https://efanomars.com/sources/mynes-0.9.tar.gz')
sha256sums=('2445a83f04b6e8d6987009065538d4032df6c115e02fe4705b68dd400f2c849c')

build() {
  cd "${srcdir}/mynes"

  ./scripts/install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/mynes"

  ./scripts/priv/dd_install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
