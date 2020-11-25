# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=mynes
pkgver=0.18
pkgrel=1
pkgdesc="Rolling minesweeper with islands and sonars"
url='https://efanomars.com/games/mynes'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.29'
    'stmm-input>=0.16'
    'gtkmm3')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("mynes")
#replaces=("mynes")
#conflicts=("mynes")

source=('https://efanomars.com/sources/mynes-0.18.tar.gz')
sha256sums=('1be93a326b613b7faa9462213eb579f324cb200eb2a23082f9a6390cfe2f84b3')

build() {
  cd "${srcdir}/mynes"

  ./scripts/install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/mynes"

  ./scripts/priv/dd_install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
