# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input
pkgver=0.13
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

source=('https://efanomars.com/sources/stmm-input-0.13.tar.gz')
sha256sums=('1f13ab89b2e05ae1f9d9ed8adceb4f9c06c71e6f020f13295b03d05c0496857b')

build() {
  cd "${srcdir}/stmm-input"

  ./scripts/install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input"

  ./scripts/priv/dd_install_stmm-input-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
