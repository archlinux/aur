pkgname=kalc
pkgver=1.0.0
pkgrel=1
pkgdesc="a complex numbers, 2d/3d graphing, arbitrary precision, vector, cli calculator with real-time output"
arch=('any')
url="https://github.com/bgkillas/kalc"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/kalc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('0ce65d76a9fbe07f3e3987cd3c70b8ca58e2634f8933425a46c5227746a14b436da389306f606092d32e97ddbad23fe13e5cd94519d1ad16e98dfa8eaf92c5f7')
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
