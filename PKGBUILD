# Maintainer: Xinkai Chen <xinkai.chen@qq.com>
pkgname=printenv2
pkgver=0.0.4
pkgrel=1
pkgdesc="A printenv2 rewrite in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Xinkai/printenv2"
license=('MIT')
makedepends=('cargo')
conflicts=('printenv2-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('14a5a3d959688c87a09384fb694885fc9885d659db46dd8af0784bfe1c44b19b')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

