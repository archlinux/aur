pkgname=kalc
pkgver=0.8.4
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('bd19cb41572c32bf5e349a2730d99a50fd89684f96a7688cf45be11dac599b22f15087045b5c820f174d9d7faba2afffa160839dce50796c2ac2832d9a4f7011')
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
