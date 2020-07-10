# Maintainer: orhun <github.com/orhun>
pkgname=kermit
pkgdesc="A VTE-based, simple and froggy terminal emulator"
pkgver=3.0
pkgrel=1
arch=('any')
url="https://github.com/orhun/kermit"
license=('GPL3')
depends=('gtk3>=3.18.9' 'vte3>=0.42.5')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/orhun/kermit/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd $pkgname-$pkgver
  mkdir -p build && cd build/
  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
