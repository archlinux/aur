# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname=array-hash
pkgver=0.7.1
pkgrel=1
pkgdesc="C++ implementation of a fast and memory efficient hash map and hash set specialized for strings"
arch=(x86_64)
url="https://github.com/Tessil/array-hash"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('086b4e8adf8c132f2667e5eb6ce21b8707681f5cf95eda8c71d0085126ce5a4b')

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
