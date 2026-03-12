pkgname=yasos-bin
pkgver=20260312
pkgrel=1
pkgdesc="Compiler for the Yasos programming language (binary release)"
arch=('x86_64')
url="https://github.com/DameChocolateYa/yasos"
license=('BSD')
depends=('llvm')
provides=('yasos')
conflicts=('yasos-git')

source=("https://github.com/DameChocolateYa/yasos/releases/download/v$pkgver-$pkgrel/yasos-linux-$pkgver-x86_64.tar.xz")
sha256sums=('sha256:d11ed6bf3b7898cc61c40eb3ada0d477c3c9c0060a3edf170a6c934dfc93055e')

package() {
  cd "$srcdir/yasos"

  install -Dm755 yasos "$pkgdir/usr/bin/yasos"

  install -Dm755 libys.so "$pkgdir/usr/lib/yslib/libys.so"

  install -d "$pkgdir/usr/include/ysinclude"
  install -Dm644 headers/* "$pkgdir/usr/include/ysinclude/"
}
