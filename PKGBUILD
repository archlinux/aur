# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=qalculate-qt
pkgname=${_pkgname}5
pkgver=4.7.0
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
sha256sums=('32783fc5efae00af8b27b3f117b88410fe20ca8810fb659d519e8fc2eaa37f06')

build() {
  cd "${_pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
