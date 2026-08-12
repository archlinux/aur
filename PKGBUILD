# Maintainer: Gabriel <horizzon3507>
pkgname=fat
pkgver=0.1.2
pkgrel=1
pkgdesc='Fast, syntax-aware cat alternative written in Rust'
arch=('x86_64')
url='https://github.com/fireflylabss/fat'
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0c0f15c8fa6abf0500039183fd7dbafc0926b6954eb084db10a00cf3d7bfaac3')

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
