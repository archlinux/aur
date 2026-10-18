# Maintainer: w1zx1
pkgname=screentaker
pkgver=0.3.1
pkgrel=1
pkgdesc="a lightweight and reliable screenshooter for Linux written in Rust"
arch=('x86_64')
options=('!debug')
url="https://github.com/w1zx1/screentaker"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/w1zx1/screentaker/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/screentaker" "$pkgdir/usr/bin/screentaker"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
