# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=difftastic
pkgver=0.17.0
pkgrel=1
pkgdesc="An experimental structured diff tool that compares files based on their syntax"
arch=("x86_64")
url="https://github.com/Wilfred/difftastic"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4c103094d0eed832ea02fc2452c23267c5aefb67d8de10db912d1727b7ffc56a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/difft" "$pkgdir/usr/bin/difft"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
