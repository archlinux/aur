# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.31
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://efanomars.com/games/jointris'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.31'
    'stmm-input>=0.16'
    'gtkmm3')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('https://efanomars.com/sources/jointris-0.31.tar.gz')
sha256sums=('d6440f16a0f89bec07893d13c259be4163415820bb13f7b580a2f7ee13bc4b1b')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
