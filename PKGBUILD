# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname=sparse-map
pkgver=0.6.2
pkgrel=1
pkgdesc="C++ implementation of a memory efficient hash map and hash set"
arch=(x86_64)
url="https://github.com/Tessil/sparse-map"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7020c21e8752e59d72e37456cd80000e18671c803890a3e55ae36b295eba99f6')

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
