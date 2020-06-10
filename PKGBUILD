# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input
pkgver=0.14
pkgrel=1
pkgdesc="Device input event library"
url='https://efanomars.com/libraries/stmm-input'
arch=('x86_64')
license=('GPL3' 'LGPL3')

depends=('gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input")
#replaces=("stmm-input")
#conflicts=("stmm-input")

source=('https://efanomars.com/sources/stmm-input-0.14.tar.gz')
sha256sums=('1cb59d997ecda211ff7b7b909bbff603eb68fcd062ca738b2b19f5d7b1401035')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
