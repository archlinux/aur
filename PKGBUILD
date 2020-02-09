pkgname=cctz
pkgver=2.3
pkgrel=1
pkgdesc="A C++ library for translating between absolute and civil times using the rules of a time zone."
arch=('x86_64')
url="https://github.com/google/cctz"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/cctz/archive/v${pkgver}.tar.gz")
sha512sums=('e688ddac1bff108e8315bf94cb61483b72b0d16f601e4e1eeb0fd5c064aefe5a573eee66e8903401aa4c2be71ea9f10dd6c9a9cdf8379f5bb6073248a21a83ff')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
