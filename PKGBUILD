# Maintainer: Benoît Rouits <brouits at free dot fr>

pkgname=qspeakers
pkgver=1.8.7
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
  "$pkgname-$pkgver.tar.gz::https://github.com/be1/qspeakers/archive/refs/tags/$pkgver.tar.gz"
)

sha256sums=(
  '07ce81daec57e59c25d1960c4fa3eccfea9b54c98dc1d08171cbcc26e42d6ec9'
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
