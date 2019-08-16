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

source=('git+https://gitlab.com/efanomars/stmm-input.git#commit=16d3aa90fc979c081adf3b1572ec26c09f7c5bfc')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
