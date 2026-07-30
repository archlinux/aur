# Maintainer: Gabriel <horizzon3507>
pkgname=ofat
pkgver=0.2.0
pkgrel=1
pkgdesc='Fast, syntax-aware cat alternative written in Rust'
arch=('x86_64')
url='https://github.com/fireflylabss/fat'
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('645af0a797626326e6500b7afe1d58d8831b6549c7c7081eb96dc7e298e82d2f')

build() {
  cd "fat-$pkgver"
  cargo build --frozen --release
}

package() {
  cd "fat-$pkgver"
  install -Dm755 target/release/ofat "$pkgdir/usr/bin/ofat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
