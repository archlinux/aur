# Maintainer: skewb1k <skewb1kunix@gmail.com>

pkgname=chroma-ls
pkgver=1.0.0
pkgrel=1
pkgdesc='LSP server for highlighting colors in source files'
url='https://github.com/skewb1k/chroma-ls'
license=('MIT')
makedepends=('cargo')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  cargo build --locked --release
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
