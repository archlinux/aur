pkgname=dgrep
pkgver=0.1.0
pkgrel=1
pkgdesc="A small recursive grep-like tool written in Rust"
arch=('x86_64')
url="https://github.com/davide-leva/dgrep"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('097499e4fa65eb7e4fb478913ecd59401cf0273454e3e42e091548586366a5a8')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/dgrep" "$pkgdir/usr/bin/dgrep"
}
