# Maintainer: w1zx1
pkgname=screentaker
pkgver=0.2.1
pkgrel=3
pkgdesc="a lightweight and reliable screenshooter for X11 written in Rust"
arch=('x86_64')
options=('!debug')
url="https://github.com/w1zx1/screentaker"
license=('MIT')
makedepends=('rust')
source=("https://github.com/w1zx1/screentaker/archive/refs/tags/v0.2.1.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-main"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-main"
  install -Dm755 "target/release/screentaker" "$pkgdir/usr/bin/screentaker"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
