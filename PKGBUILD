pkgname=yasos-bin
pkgver=20260427
pkgrel=1
pkgdesc="Compiler for the Yasos programming language (binary release)"
arch=('x86_64')
url="https://github.com/DameChocolateYa/yasos"
license=('BSD-3-Clause')
depends=('llvm')
provides=('yasos')
conflicts=('yasos-git')

source=("https://github.com/DameChocolateYa/yasos/releases/download/v$pkgver-$pkgrel/yasos-linux-$pkgver-x86_64.tar.xz")
sha256sums=('4c291328984bd77d5b7011dad08c9fed9b0b1409aded1ccbbfdf5b7428d88806')

package() {
  cd "$srcdir/yasos"

  install -Dm755 yasos "$pkgdir/usr/bin/yasos"

  install -Dm755 libys.so "$pkgdir/usr/lib/yslib/libys.so"

  install -d "$pkgdir/usr/include/ysinclude"
  install -Dm644 headers/* "$pkgdir/usr/include/ysinclude/"
}
