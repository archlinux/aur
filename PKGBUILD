# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.20
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://efanomars.com/jointris'
arch=('x86_64')
license=('GPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('https://efanomars.com/sources/jointris-0.20.tar.gz')
sha256sums=('96d24db95cb3fe9529fbf3d5ff77116c6226a84612f4b3a1fc191378e0caf9d4')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
