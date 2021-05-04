# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2021.04.0
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('flowee>=2021.04.0' 'qt5-base')
makedepends=('boost' 'cmake')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz")
sha256sums=('85e5b81f94edea3b595eef4e477767b37653f0254b258b78be47915b9c568bcc')

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/ ../pay-$pkgver
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
