pkgname=kalc
pkgver=1.0.3
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('369b5a0ed1ebe3c01079c4af93473b280c647d3c4d2c42a7cde3fef793c5747ece941d5f1d9f9a19286de64fd3ba3e14077bf2749ce3e06df08c2c0f26ea7add')
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
