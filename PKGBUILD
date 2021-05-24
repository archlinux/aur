# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.6.1
pkgrel=2
pkgdesc="DIY speaker design software"
url="http://brouits.free.fr/qspeakers/"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL3')
depends=('qt5-charts')
makedepends=('qt5-tools')
conflicts=('qspeakers-svn')
install=qspeakers.install
source=(
  "http://brouits.free.fr/${pkgname}/${pkgname}-${pkgver}.tar.gz"
)
 
sha256sums=(
  '62b829f7344e091e0106f2ad76908dcda6762fc279699d6b85d8a867dbe4fd33'
)
 
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake PREFIX=/usr -config release
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install INSTALL_ROOT="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
