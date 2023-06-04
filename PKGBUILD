pkgname=kalc
pkgver=0.6.0
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2cc73ac3203894d05985d9bd59befa1b7886a0fcad22f8717220700f05a1d2239a677a8ed2b6a486a4bae842d3ea120f4c5b58f266bc2096bc1fcfef6102ede6')
build(){
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package(){
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
