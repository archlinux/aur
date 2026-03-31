# Maintainer: Hundaol Dejen <hundaoldejen1@gmail.com>
pkgname=rsm
pkgver=0.2.1
pkgrel=2
pkgdesc="A safe, fast, and modular symlink manager written in Rust"
arch=('x86_64')
url="https://github.com/hunde32/rsm"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('57eafc65a5ca4f4208cd3ab84ce36157b05419d3c0912920b649816d2cc53d11')

build() {
  cd "rsm-$pkgver"
  cargo build --release --locked
}

package() {
  cd "rsm-$pkgver"
  install -Dm755 "target/release/rsm" "$pkgdir/usr/bin/rsm"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
