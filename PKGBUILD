# Maintainer: QwerProg
pkgname=bili-tools
pkgver=0.1.2
pkgrel=1
pkgdesc="B站直播开播工具 — 命令行一键开播/下播"
arch=('x86_64' 'aarch64')
url="https://github.com/QwerProg/bili-tools"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("https://github.com/QwerProg/bili-tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ff78602f88b0dcfff4a204875cbb8c7a75ea73a7dfd873fa3131d372ecf2893')

build() {
  cd "$srcdir/bili-tools-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/bili-tools-$pkgver"
  install -Dm755 target/release/bt "$pkgdir/usr/bin/bt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
