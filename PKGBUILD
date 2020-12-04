# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.30
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://efanomars.com/games/jointris'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.30'
    'stmm-input>=0.16'
    'gtkmm3')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('https://efanomars.com/sources/jointris-0.30.tar.gz')
sha256sums=('6203374b1b588612d6fc07085e900bad8700cf0a82cafb1f3714b119d6f6c7df')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
