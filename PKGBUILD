# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=alexandra
pkgver=1.5.0
pkgrel=1
pkgdesc="A small and user friendly opensource video library with great potential"
arch=('i686' 'x86_64')
url="http://alexandra-qt.sourceforge.net/"
license=('GPL2')
depends=('hicolor-icon-theme' 'libmediainfo' 'qt5-base')
makedepends=('qt5-tools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeka-js/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f541144aaf6fb51a4e8eeb23bfc03ef77fd5097b9351ff5efc757c14890f7dbe')

build() {
  cd "${pkgname}-${pkgver}"
  qmake-qt5 PREFIX=/usr alexandra.pro
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
