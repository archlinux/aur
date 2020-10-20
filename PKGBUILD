# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=mynes
pkgver=0.15
pkgrel=1
pkgdesc="Rolling minesweeper with islands and sonars"
url='https://efanomars.com/games/mynes'
arch=('x86_64' 'aarch64')
license=('GPL3')

depends=(
    'stmm-games>=0.26'
    'stmm-input>=0.15'
    'gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("mynes")
#replaces=("mynes")
#conflicts=("mynes")

source=('https://efanomars.com/sources/mynes-0.15.tar.gz')
sha256sums=('ed6c0a5054003159f6860bd434e0bfb9c2af72e4e014723013829b8c27e5e8c0')

build() {
  cd "${srcdir}/mynes"

  ./scripts/install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/mynes"

  ./scripts/priv/dd_install_mynes-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
