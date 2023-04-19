# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=qalculate-qt
pkgname=${_pkgname}5
pkgver=4.6.1
pkgrel=1
pkgdesc='Qt5 frontend for libqalculate'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://qalculate.github.io/'
license=('GPL')
depends=("libqalculate>=${pkgver}" 'qt5-svg' 'hicolor-icon-theme')
makedepends=('qt5-tools')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://github.com/Qalculate/qalculate-qt/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('33541ed71be9e179760c3e38d65dcb9c2b10940ed8c197428832bc3537e2225d')

build() {
  cd "${_pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
