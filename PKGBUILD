# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input
pkgver=0.5
pkgrel=1
pkgdesc="Device input event library"
url='https://www.efanomars.com/libraries/stmm-input'
arch=('x86_64')
license=('GPL3','LGPL3')

depends=('gtkmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input")
#replaces=("stmm-input")
#conflicts=("stmm-input")

source=('git+https://gitlab.com/efanomars/stmm-input.git#commit=bdfb48c2902dc7bc13876c001e3a049237544f6f')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
