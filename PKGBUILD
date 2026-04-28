pkgname=yasos-bin
pkgver=20260428
pkgrel=1
pkgdesc="Compiler for the Yasos programming language (binary release)"
arch=('x86_64')
url="https://github.com/DameChocolateYa/yasos"
license=('BSD-3-Clause')
depends=('llvm')
provides=('yasos')
conflicts=('yasos-git')

source=("https://github.com/DameChocolateYa/yasos/releases/download/v$pkgver-$pkgrel/yasos-linux-$pkgver-x86_64.tar.xz")
sha256sums=('5407bc92838988eb045e6eabc22d5d557d8b9722d72b9a2ed41ed7e3bd9a5c7e')

package() {
  cd "$srcdir/yasos"

  install -Dm755 yasos "$pkgdir/usr/bin/yasos"

  install -Dm755 libys.so "$pkgdir/usr/lib/yslib/libys.so"

  install -d "$pkgdir/usr/include/ysinclude"
  install -Dm644 headers/* "$pkgdir/usr/include/ysinclude/"
}
