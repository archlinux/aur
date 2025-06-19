# Maintainer: maelstrom57 <melv.douc@gmail.com>
pkgname=connect4-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal-based Connect 4 game written in Rust"
arch=('x86_64')
url="https://github.com/MelvDouc/$pkgname"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94720efabca2359c472b5643b151f6ec566a5bf51497e02daf3ecda32032b98a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$HOME/.local/bin/$pkgname"
}
