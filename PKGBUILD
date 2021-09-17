# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=difftastic
pkgver=0.9.0
_pkgver="0.9"
pkgrel=1
pkgdesc="An experimental structured diff tool that compares files based on their syntax"
arch=("x86_64")
url="https://github.com/Wilfred/difftastic"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('82a5448f6fe3efe19ee67c3ec9e87655d7f3b10cd67b7d1c1d8d6999d11ec700')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$_pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
