# Maintainer: Xinkai Chen <xinkai.chen@qq.com>
pkgname=printenv2
pkgver=0.1.0
pkgrel=1
pkgdesc="A printenv2 rewrite in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Xinkai/printenv2"
license=('MIT')
makedepends=('cargo')
conflicts=('printenv2-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('65c635b0f8e59bbae722e312e0a1cf73e34dd6bd0884a68cb825def8a8364aa3')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

