# Maintainer: Josema294 https://github.com/josema294
pkgname=wtop
pkgver=0.2.0
pkgrel=1
pkgdesc="A web-based system monitor written in Rust, providing real-time metrics for CPU, GPU, memory, disks, and network"
arch=('x86_64')
url="https://github.com/josema294/wtop"
license=('AGPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a5088652e93ea345e51c6ca618b4aa7b265117c9dcaf46d4364de7fcaa1c1ee')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/wtop" "$pkgdir/usr/bin/wtop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
