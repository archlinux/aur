# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2021.01.1
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('flowee>=2021.01.1' 'qt5-base')
makedepends=('boost' 'cmake')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz")
sha256sums=('35cc3810733250aa1c256ab4f4475650028ca9562801c5cc5d3fda3311681206')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay-$pkgver
  make
}

check() {
    cd build/testing
    make check
}

package() {
  cd build
  make install
}
