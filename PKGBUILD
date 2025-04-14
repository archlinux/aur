# Maintainer: caputmanus <caputmanus@outlook.com>

pkgname=aware
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple process supervisor in Rust"
arch=('x86_64')
url="https://github.com/spice-itself/aware"
license=('MIT')
makedepends=('rust' 'cargo')
source=("git+https://github.com/spice-itself/aware.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo clean
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
