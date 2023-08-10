pkgname=quec
pkgver=0.1.2
pkgrel=1
pkgdesc="a simple text editor"
arch=('any')
url="https://github.com/bgkillas/quec"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/quec/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3a9f31c6fbbd11489c561f24b990f20b00e78141a59d9086800046706974d7a3a36b851a8dd55d23e4f284d0d601ecc42ee21829680e36ecda30500048b35f50')
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
