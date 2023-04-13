# Maintainer: Xinkai Chen <xinkai.chen@qq.com>
pkgname=printenv2
pkgver=0.1.1
pkgrel=1
pkgdesc="A printenv2 rewrite in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Xinkai/printenv2"
license=('MIT')
makedepends=('cargo')
conflicts=('printenv2-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e80044ae123f84d51230dfd0ec0070ad7be4046cce45ac5b2cee9a37700b1bc0')

build() {
  cd "$pkgname-$pkgver"
  CARGO_TARGET_DIR=target cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

