# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-games
pkgver=0.14
pkgrel=1
pkgdesc="C++ 2D games library"
url='https://www.efanomars.com/libraries/stmm-games'
arch=('x86_64')
license=('LGPL3')

depends=('stmm-input' 'gtkmm3' 'librsvg' 'libxml++2.6')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-games")
#replaces=("stmm-games")
#conflicts=("stmm-games")

source=('https://efanomars.com/sources/stmm-games-0.14.tar.gz')
sha256sums=('0bbfbe5f2c36a9f0b64af71357d8c742504487fc2e6fdda4c03d46b79df4aac8')

build() {
  cd "${srcdir}/stmm-games"

  ./scripts/install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-games"

  ./scripts/priv/dd_install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
