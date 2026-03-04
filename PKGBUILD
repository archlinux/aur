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
sha256sums=("71b99e0bdb7a37080f72f33cd9249d4764716b644743d73dcf545fd556dda8e3")

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wtop" "$pkgdir/usr/bin/wtop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
