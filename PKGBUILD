# Maintainer: Sashetophizika

pkgname=hyprscratch
pkgver=0.6.5
pkgrel=1
pkgdesc="Improved scratchpad functiontality for Hyprland"
url="https://github.com/sashetophizika/hyprscratch"
makedepends=('cargo')
depends=('hyprland')
optdepends=('fzf' 'rofi')
arch=('x86_64')
license=('MIT')
source=("https://github.com/sashetophizika/hyprscratch/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aad4cb9f33cf6c7b16003c56f386fc9f77ff5fa3222069ddc5f9e6a043de64ff')

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
