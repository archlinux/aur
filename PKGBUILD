# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-xi
pkgver=0.8
pkgrel=1
pkgdesc="Device input event library - xi floating keyboards"
url='https://www.efanomars.com/libraries/stmm-input-xi'
arch=('x86_64')
license=('GPL3' 'LGPL3')

depends=('stmm-input' 'gtkmm3' 'libx11' 'libxi')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-xi")
#replaces=("stmm-input-xi")
#conflicts=("stmm-input-xi")

source=('https://efanomars.com/sources/stmm-input-xi-0.8.tar.gz')
sha256sums=('b6268b21267d5be8015dae9df25e8cf91896cabb9fcee0d1c182ca2a2d61bdfd')

build() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/priv/dd_install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
