# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input
pkgver=0.12
pkgrel=1
pkgdesc="Device input event library"
url='https://efanomars.com/stmm-input'
arch=('x86_64')
license=('GPL3' 'LGPL3')

depends=('gtkmm3')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input")
#replaces=("stmm-input")
#conflicts=("stmm-input")

source=('https://efanomars.com/sources/stmm-input-0.12.tar.gz')
sha256sums=('2e3e8416c89a3ca7dd3b1e69e4fc895737ecce29854faa4310954813e25666ca')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
