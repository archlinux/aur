# Maintainer: maelstrom57 <melv.douc@gmail.com>
pkgname=connect4-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal-based Connect 4 game written in Rust"
arch=('x86_64')
url="https://github.com/MelvDouc/$pkgname"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-v$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz") # Change to "v$pgkver" next release
sha256sums=('f21b8ad4106659a6a957b7f35dd74f19f032deb5e064ad5ed4818297af271bc1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$HOME/.local/bin/$pkgname"
}
