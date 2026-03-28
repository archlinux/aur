# Maintainer: Hundaol Dejen <hundaoldejen1@gmail.com>
pkgname=rsm
pkgver=0.1.1
pkgrel=1
pkgdesc="A safe, fast, and modular symlink manager written in Rust"
arch=('x86_64')
url="https://github.com/hunde32/rsm"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('254a0d586460c62fdb13b542888bf8497438891f54fa00c99b819f0dfe891ffe')

build() {
  cd "rsm-$pkgver"
  cargo build --release --locked
}

package() {
  cd "rsm-$pkgver"
  install -Dm755 "target/release/rsm" "$pkgdir/usr/bin/rsm"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
