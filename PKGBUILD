pkgname=quec
pkgver=0.1.3
pkgrel=1
pkgdesc="a simple text editor"
arch=('any')
url="https://github.com/bgkillas/quec"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/quec/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e18497d66671ac7de61b5836f5811ecf99b1a2fe800dc7cce1c0867fce22ebf987352cf06417eca4ea4b1ab24fdf33cb78ea0913bd4be4fdf21b3a9bdf12cb65')
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
