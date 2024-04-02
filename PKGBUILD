pkgname=kalc
pkgver=1.1.0
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9533bc6e612009621e0815b757d493d9202f46bcbc03e7e705554b6e78bc33bf7d8eaba3950a3afcacd55c7c5fd139166678f5949d1c3e4e7ede8dc240f57970')
build()
{
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/kalc "$pkgdir/usr/bin/kalc"
}
