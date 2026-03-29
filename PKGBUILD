pkgname=swagsh
pkgver=0.5.0
pkgrel=1
pkgdesc="A really small shell that aims to be fast and posix-compatible"
arch=('x86_64')
url="https://github.com/takashialpha/swagsh"
license=('Apache')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/takashialpha/swagsh/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/swagsh \
    "$pkgdir/usr/bin/swagsh"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
