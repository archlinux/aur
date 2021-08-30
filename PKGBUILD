# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=qalculate-qt
pkgname=${_pkgname}5
pkgver=3.20.1
pkgrel=1
pkgdesc='Qt5 frontend for libqalculate'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://qalculate.github.io/'
license=('GPL')
depends=('libqalculate' 'qt5-svg' 'hicolor-icon-theme')
source=("https://github.com/Qalculate/qalculate-qt/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('189e952b2b6b99ef63db46bd70d31f140adf19e8364d0eb4064daefca6a16e8a')

build() {
  cd "${_pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
