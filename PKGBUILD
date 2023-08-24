pkgname=quec
pkgver=0.1.5
pkgrel=1
pkgdesc="a simple text editor"
arch=('any')
url="https://github.com/bgkillas/quec"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/quec/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('eb6b57a72db053f83c551e4c037d3a0beb85b0bc48bcc63cc2759b95b71328393778638ad5264b4e2fde230c7e6fa34abb3b0c9c3da1e4e5b23ad57a8ea1654a')
build()
{
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}
package()
{
  cd "$srcdir/$pkgname-$pkgver"
  install -D target/release/quec "$pkgdir/usr/bin/quec"
}
