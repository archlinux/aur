# Maintainer: Josema294 intrepido.absinthe645@passinbox.com
pkgname=wtop
pkgver=0.3.0
pkgrel=1
pkgdesc="A web-based system monitor written in Rust, providing real-time metrics for CPU, GPU, memory, disks, and network"
arch=('x86_64')
url="https://github.com/josema294/wtop"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("f876d4454e47b68c6e3ad13641a0ed3285e177912877fa53850f1df32672f8e6")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wtop" "$pkgdir/usr/bin/wtop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
