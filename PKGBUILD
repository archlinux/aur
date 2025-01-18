# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.7
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
  '9062786dc87499d0fc528e74cd61786f838c4b4f4fe483de6bbf595cdce8bdc2'
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
