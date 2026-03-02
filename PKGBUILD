# Maintainer: Josema294 intrepido.absinthe645@passinbox.com
pkgname=wtop
pkgver=0.2.0
pkgrel=3
pkgdesc="A web-based system monitor written in Rust, providing real-time metrics for CPU, GPU, memory, disks, and network"
arch=('x86_64')
url="https://github.com/josema294/wtop"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('207d2f7647d1a36a34c97d5ee8581232934fedc437f843505ff7374538839023')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wtop" "$pkgdir/usr/bin/wtop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
