# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.25
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://efanomars.com/games/jointris'
arch=('x86_64')
license=('GPL3')

depends=(
    'stmm-games>=0.25'
    'stmm-input>=0.14'
    'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('https://efanomars.com/sources/jointris-0.25.tar.gz')
sha256sums=('7caca082f9e3be9935a96ff8a7c8ccc1ab3c533511456320ba52d7a6097e0a46')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
