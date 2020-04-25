# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-games
pkgver=0.20
pkgrel=1
pkgdesc="C++ 2D games library"
url='https://efanomars.com/stmm-games'
arch=('x86_64')
license=('LGPL3')

depends=('stmm-input-au' 'stmm-input' 'gtkmm3' 'librsvg' 'libxml++2.6')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-games")
#replaces=("stmm-games")
#conflicts=("stmm-games")

source=('https://efanomars.com/sources/stmm-games-0.20.tar.gz')
sha256sums=('7a4c71f3f5b79c7134a1b5a6b8b4418ed028e5b5f5541385367e62f4531aae8d')

build() {
  cd "${srcdir}/stmm-games"

  ./scripts/install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-games"

  ./scripts/priv/dd_install_stmm-games-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
