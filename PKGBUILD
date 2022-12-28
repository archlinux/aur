# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.6.5
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
  '96586d829d946987a4697bea30bffb8c5489d79e90592246b36f6977509d1f98'
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
