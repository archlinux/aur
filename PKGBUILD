# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>

pkgname=ordered-map
pkgver=1.1.0
pkgrel=1
pkgdesc="C++ hash map and hash set which preserve the order of insertion"
arch=(x86_64)
url="https://github.com/Tessil/ordered-map"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d6070502351646d68f2bbe6078c0da361bc1db733ee8a392e33cfb8b31183e28')

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
