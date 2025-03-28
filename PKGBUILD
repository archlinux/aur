# Maintainer: Digua Dong <dongdigua@outlook.com>
pkgname=wl-binclock
pkgver=1.1.0
pkgrel=1
pkgdesc="binary clock for wayland in rust"
arch=('x86_64')
url="https://github.com/dongdigua/wl-binclock"
license=('MIT')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e9b285cf7d93b6857bf7adde5452e032cabf15089834ded2887986da1a1e949')

build() {
  ls
  cd "$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/wl_binclock" "$pkgdir/usr/bin/wl_binclock"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
