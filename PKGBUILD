# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=difftastic
pkgver=0.11.0
_pkgver="0.11.0"
pkgrel=1
pkgdesc="An experimental structured diff tool that compares files based on their syntax"
arch=("x86_64")
url="https://github.com/Wilfred/difftastic"
license=("MIT")
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz")
sha256sums=('d59179e6279dffe7b2aebc003db409a7adfc5c6acfa0576157c47e3e5536808a')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$_pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
