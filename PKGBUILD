# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname=array-hash
pkgver=0.7.2
pkgrel=1
pkgdesc="C++ implementation of a fast and memory efficient hash map and hash set specialized for strings"
arch=(x86_64)
url="https://github.com/Tessil/array-hash"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0f360be97fe21a3d6dc4e843559a3f7011e90cb31b483875802205209766591e')

build() {
  cd $pkgname-$pkgver
  cmake . \
      -Bbuild \
      -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
