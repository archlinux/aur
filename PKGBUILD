# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=jointris
pkgver=0.10
pkgrel=1
pkgdesc="Joinable tetris blocks with bombs"
url='https://www.efanomars.com/games/jointris'
arch=('x86_64')
license=('GPL3', 'LGPL3')

depends=('stmm-games' 'stmm-input' 'gtkmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("jointris")
#replaces=("jointris")
#conflicts=("jointris")

source=('git+https://gitlab.com/efanomars/jointris.git#commit=bffcaf8826a04db840aa7e4222ff8660c6c9883a')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/jointris"

  ./scripts/install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/jointris"

  ./scripts/priv/dd_install_jointris-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
