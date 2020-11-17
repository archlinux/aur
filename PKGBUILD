# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2020.07.1
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('flowee>=2020.07.0' 'qt5-base')
makedepends=('boost' 'cmake')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz")
sha256sums=('bf688e37d57e6e9cfad6f74212f753a8db24c1da1dfecbb492775506788e07dc')

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
