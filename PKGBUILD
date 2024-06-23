pkgname=kalc
pkgver=1.2.1
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector/matrix, cli calculator with real-time output and support for units"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust' 'diffutils' 'gcc' 'm4' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('eec58b5bb9cbf6fecaf636ef4e04686b66c88f1a6fdff5de9f3270a43acf8246e37f7785f027e606d51f1fc7703d13e2d8ecdf9f486290cc9536d8d2eb093138')
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
