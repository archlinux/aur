# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2020.05.1
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64')
url="https://flowee.org/"
license=('GPL3')
depends=('flowee-libs' 'qt5-base')
makedepends=('boost' 'cmake')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz")
sha256sums=('6ab2a878321655f98529bba58122efbd4ed36eb796be99b47ca462b7d1e7cc44')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay
  make
}

package() {
  cd build
  make install
}
