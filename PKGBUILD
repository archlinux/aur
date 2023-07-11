pkgname=kalc
pkgver=0.7.4
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('be8f70e917a2382b81b0510675d4d16242b55d4bc7631f3973acdb753d000846fc764f4d6d2af1119fbca2c00c71b94d249e82cc4b0822e851d218e1c3869f73')
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
