# Maintainer: Gabriel <horizzon3507>
pkgname=fat
pkgver=0.1.1
pkgrel=1
pkgdesc='Fast, syntax-aware cat alternative written in Rust'
arch=('x86_64')
url='https://github.com/fireflylabss/fat'
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e61891f5e3abe2a63801bedaf707517faf7f58afcf035589fe0ce02945eb4a2')

build() {
  cd "fat-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "fat-$pkgver"
  install -Dm755 target/release/fat "$pkgdir/usr/bin/fat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
