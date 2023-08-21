pkgname=quec
pkgver=0.1.4
pkgrel=1
pkgdesc="a simple text editor"
arch=('any')
url="https://github.com/bgkillas/quec"
license=('GPL3')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bgkillas/quec/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('dcfc0a90dd2daa7ab3bf664482ff5bd36979004a8bb28eabafbff1aeee012dfa6d5856c64fc19ddf27fac5b0639ab35ac38464d0a373f73f58ee96cfaa47091c')
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
