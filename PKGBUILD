# Maintainer: Kurt Cancemi <kurt@x64architecture.com>
# Upstream URL: https://www.x64architecture.com/libicuid

pkgname=libicuid
pkgver=1.3.1
pkgrel=1
pkgdesc='I C U ID is a modern library that provides a C interface for the CPUID opcode'
arch=('i686' 'x86_64')
url='https://www.x64architecture.com/libicuid'
license=('isc')
source=("https://github.com/x64architecture/libicuid/archive/${pkgver}.tar.gz")
sha256sums=('fae99de30c99f75f969ab1f8075bb88f736a3d20ff71760ccc08d437694ef17e')
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
