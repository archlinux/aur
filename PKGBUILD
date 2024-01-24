# Maintainer: Xinkai Chen <xinkai.chen@qq.com>
pkgname=printenv2
pkgver=0.1.3
pkgrel=1
pkgdesc="A printenv2 rewrite in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Xinkai/printenv2"
license=('MIT')
makedepends=('cargo')
conflicts=('printenv2-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8aadc0de0f56407c3d20d0b52b5b57f639a84ab50f4355a33b114e012e980351')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

