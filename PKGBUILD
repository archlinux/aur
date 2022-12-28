# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.6.6
pkgrel=1
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
  '51ca23a4456a1aafcfb2d9ec51c9e10f0510401f96df6c4eb26c00e198a71286'
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
