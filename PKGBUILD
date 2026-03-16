# Maintainer: 5c0 <admin@5c0.io>
pkgname=metropolis
pkgver=0.1.0
pkgrel=1
pkgdesc="A cinematic, retro-cyberpunk system monitor for the terminal powered by Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/5c0/metropolis"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP') # User should update this after tagging a release

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
