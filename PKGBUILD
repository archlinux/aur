pkgname=cctz
pkgver=2.2
pkgrel=1
pkgdesc="A C++ library for translating between absolute and civil times using the rules of a time zone."
arch=('x86_64')
url="https://github.com/google/cctz"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/cctz/archive/v${pkgver}.tar.gz")
sha512sums=('27a9116721a78aff4f692499a48b48ddab7210216b84cff4192414c3e769fede4018118422676981a41ccd09e517a0892d6d732ed7e347ac5e4026ae64999fa4')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
