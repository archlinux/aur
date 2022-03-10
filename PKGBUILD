# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=difftastic
pkgver=0.22.0
pkgrel=0
pkgdesc="An experimental structured diff tool that compares files based on their syntax"
arch=("x86_64")
url="https://github.com/Wilfred/difftastic"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0c3a5a93161602d05490f0fae7883e23b953c91fbc6d2d58f3ac85483328623b')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/difft" "$pkgdir/usr/bin/difft"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
