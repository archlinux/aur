#
# Touchégg : Multitouch gesture recogniser
#
# Maintainer: Guillaume Turchini <guillaume.turchini@gmail.com>"

_pkgname=touchegg
pkgname=${_pkgname}-git
pkgver=r196.6bccd0d
pkgrel=1
pkgdesc='Multitouch gesture recogniser'
arch=('i686' 'x86_64')
url='https://github.com/JoseExposito/touchegg'
license=('GPL')
source=("${_pkgname}::git+https://github.com/JoseExposito/touchegg")
depends=('qt4' 'geis')
makedepends=('git')
md5sums=('SKIP')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}/
  qmake-qt4
  make
}

package() {
  cd $srcdir/${_pkgname}/
  INSTALL_ROOT="$pkgdir" make install
}
