# Maintainer: Josema294 intrepido.absinthe645@passinbox.com
pkgname=wtop
pkgver=0.2.1
pkgrel=1
pkgdesc="A web-based system monitor written in Rust, providing real-time metrics for CPU, GPU, memory, disks, and network"
arch=('x86_64')
url="https://github.com/josema294/wtop"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('af21e03457bd557639eff29f50398c0c71aabdbf431eda8d36cfd2800f986769')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wtop" "$pkgdir/usr/bin/wtop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
