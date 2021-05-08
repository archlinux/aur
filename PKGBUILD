# Maintainer: Tom Zander

pkgname=flowee-pay
pkgver=2021.04.1
pkgrel=1
pkgdesc="Flowee Payment solution"
arch=('x86_64' 'aarch64')
url="https://flowee.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('boost' 'cmake' 'flowee>=2021.04.0')
provides=('flowee-pay')
source=("https://gitlab.com/FloweeTheHub/pay/-/archive/$pkgver/pay-$pkgver.tar.gz")
sha256sums=('fbfdb2fcb1fd2f92384e7901293d71c98fcb063ef963a033e410483c1d1da640')

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
