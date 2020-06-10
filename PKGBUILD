# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.24
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://efanomars.com/games/jointris'
arch=('x86_64')
license=('GPL3')

depends=(
    'stmm-games>=0.24'
    'stmm-input>=0.14'
    'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('https://efanomars.com/sources/jointris-0.24.tar.gz')
sha256sums=('a3923dad1508c2cf6b2b00bc00d9ee3f9617d3100992b8fb294b2e6ddd3349f8')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
