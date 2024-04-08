pkgname=kalc
pkgver=1.1.1
pkgrel=2
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aa7449eefe41a27f6af8311e7ba25cb8b850b143a172a24fbad6dd76f67cd0be1f47b5b787418e97d8ac25f5e4f3be7378ffbc31f2c0d0d62a8b2e014ae75da1')
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
