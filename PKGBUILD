# Maintainer: Czcibor Bohusz-Dobosz <czbd o2 pl>

_pkgname=qalculate-qt
pkgname=${_pkgname}-git
pkgver=r145.b9ef6df
pkgrel=1
pkgdesc='Qt5 frontend for libqalculate'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://qalculate.github.io/'
license=('GPL')
depends=("libqalculate-git" 'qt6-svg' 'hicolor-icon-theme')
makedepends=('qt6-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/Qalculate/qalculate-qt.git')
md5sums=('SKIP')

build() {
  cd "${_pkgname}"
  qmake6 PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}
