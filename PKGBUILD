# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=stmm-input-xi
pkgver=0.4
pkgrel=1
pkgdesc="Device input event library - xi floating keyboards"
url='https://www.efanomars.com/libraries/stmm-input-xi'
arch=('x86_64')
license=('GPL3')

depends=('stmm-input' 'gtkmm' 'libx11' 'libxi')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("stmm-input-xi")
#replaces=("stmm-input-xi")
#conflicts=("stmm-input-xi")

source=('git+https://gitlab.com/efanomars/stmm-input-xi.git#commit=8db82705374ab32a25b59f76b3d12d3ed57cd75d')
sha512sums=('SKIP')

build() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/stmm-input-xi"

  ./scripts/priv/dd_install_stmm-input-xi-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}
