# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.18
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://www.efanomars.com/games/jointris'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('https://efanomars.com/sources/jointris-0.18.tar.gz')
sha256sums=('445ff5923a62cdb48b84ec1ac34bb500fd13fd767f1bfc4a381116b995b60367')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
