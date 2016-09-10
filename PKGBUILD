#Maintainer: Paolo Stivanin <info@paolostivanin.com>

_pkgname=qt5-enginio
pkgname=${_pkgname}-git
pkgver=r1173.3bdf6de
pkgrel=1
pkgdesc="Client library for accessing Enginio service from Qt and QML code."
arch=("i686" "x86_64")
url="https://github.com/qt/qtenginio"
license=("BSD")
depends=('qt5-base>=5.5.0' 'openssl' 'perl>=5.10')
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/qt/qtenginio.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  qmake
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}
