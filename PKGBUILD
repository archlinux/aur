# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-xi
pkgver=0.5
pkgrel=1
pkgdesc="Device input event library - xi floating keyboards"
url='https://www.efanomars.com/libraries/stmm-input-xi'
arch=('x86_64')
license=('GPL3','LGPL3')

depends=('stmm-input' 'gtkmm' 'libx11' 'libxi')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-xi")
#replaces=("stmm-input-xi")
#conflicts=("stmm-input-xi")

source=('git+https://gitlab.com/efanomars/stmm-input-xi.git#commit=e1bb4941128b521fb54bd4b835a1b5166ac6d2b2')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/priv/dd_install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
