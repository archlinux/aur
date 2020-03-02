# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.17
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

source=('https://efanomars.com/sources/jointris-0.17.tar.gz')
sha256sums=('f09ae715dd5ea0879ff91cbf1a7d5cfaeb002de4571e5fe8eb8c3184168d21d1')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
