# Maintainer: Xinkai Chen <xinkai.chen@qq.com>
pkgname=printenv2
pkgver=0.0.2
pkgrel=1
pkgdesc="A printenv2 rewrite in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Xinkai/printenv2"
license=('MIT')
makedepends=('cargo')
conflicts=('printenv2-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a069b78a1faa6a5a3391d03fc9f53178cbe6fe641b9409b8133f8b81a68ebe19')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

