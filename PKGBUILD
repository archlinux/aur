pkgname=quec
pkgver=0.1.1
pkgrel=1
pkgdesc="a simple text editor"
arch=('any')
url="https://github.com/bgkillas/quec"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/quec/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d389de8e953bde9095fdae1c579f5f13e519b8ceb23aaf66fd2967c2f6631a13c5e2dfd0635a6e395865a3004460c997592366da624a7271dbfc1f8eefbb6290')
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
