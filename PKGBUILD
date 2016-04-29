# Maintainer: Kurt Cancemi <kurt@x64architecture.com>
# Upstream URL: https://www.x64architecture.com/libicuid

pkgname=libicuid
pkgver=1.4.1
pkgrel=1
pkgdesc='I C U ID is a modern library that provides a C interface for the CPUID opcode'
arch=('i686' 'x86_64')
url='https://www.x64architecture.com/libicuid'
license=('isc')
source=("https://github.com/x64architecture/libicuid/archive/${pkgver}.tar.gz")
sha256sums=('0cd7dae7411620b85bb1a140bf915ad39493e1704e81ef3255712197aa9d1ed3')
makedepends=('cmake')

prepare() {
  cd libicuid-${pkgver}
}

build() {
  cd libicuid-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release .
  make 
}

package() {
  cd libicuid-${pkgver}

  make DESTDIR="$pkgdir/" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
