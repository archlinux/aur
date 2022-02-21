# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=difftastic
pkgver=0.20.0
pkgrel=0
pkgdesc="An experimental structured diff tool that compares files based on their syntax"
arch=("x86_64")
url="https://github.com/Wilfred/difftastic"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d647e5ca224408a0d0133972db3b4fb5b627279c4f4c0c7d18bb32ef8af8090c')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/difft" "$pkgdir/usr/bin/difft"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
