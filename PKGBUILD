# Maintainer: maelstrom57 <melv.douc@gmail.com>
pkgname=connect4-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal-based Connect 4 game written in Rust"
arch=('x86_64')
url="https://gitlab.com/melvdouc-group/connect4-cli"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/connect4-cli-v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/connect4" "$pkgdir/usr/bin/connect4-cli"
}
