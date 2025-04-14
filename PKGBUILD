# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.8
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
  "http://brouits.free.fr/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
 
sha256sums=(
  '4518d55847670b4cca760a689312e63d682b418cddd22c330c738ef89e491047'
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
