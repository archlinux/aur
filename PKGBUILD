# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.8.5
pkgrel=1
pkgdesc="DIY speaker design software"
url="http://brouits.free.fr/qspeakers/"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL3')
depends=('qt6-charts')
makedepends=('qt6-tools')
conflicts=('qspeakers-svn')
install=qspeakers.install
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/be1/qspeakers/archive/refs/tags/${pkgver}.tar.gz"
)
 
sha256sums=(
  'c9c5dca9e380a7c1507a9e0c7a14212e170d82f697d6fba640bda867b54cd373'
)
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake6 PREFIX=/usr -config release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
