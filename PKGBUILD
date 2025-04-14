# Maintainer: caputmanus <caputmanus@outlook.com>

pkgname=aware
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple process supervisor in Rust"
arch=('x86_64')
url="https://github.com/spice-itself/aware"
license=('MIT')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/spice-itself/aware/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('PUT_SHA256SUM_HERE')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
