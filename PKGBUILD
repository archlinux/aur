# Maintainer: maelstrom57 <melv.douc@gmail.com>
pkgname=connect4-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal-based Connect 4 game written in Rust"
arch=('x86_64')
url="https://github.com/MelvDouc/connect4-cli"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f4a936bad57ec13b8383f42a28b82fa7162b3eb85d8c2c73a79d82b86a81de45')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/connect4" "$HOME/.local/bin/$pkgname"
}
