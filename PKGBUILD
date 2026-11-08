# Maintainer: Sashetophizika

pkgname=hyprscratch
pkgver=0.7.0
pkgrel=1
pkgdesc="Improved scratchpad functiontality for Hyprland"
url="https://github.com/sashetophizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
optdepends=('fzf' 'rofi')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sashetophizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3165c12d589846b338b560035428a2010d4140034c0372cfc34f8797350099dd')

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
