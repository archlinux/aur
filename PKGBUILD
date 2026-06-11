pkgname=yasos-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Compiler for the Yasos programming language (binary release)"
arch=('x86_64')
url="https://github.com/DameChocolateYa/yasos"
license=('BSD-3-Clause')
depends=('llvm')
provides=('yasos')
conflicts=('yasos-git')

source=("https://github.com/DameChocolateYa/yasos/releases/download/v$pkgver/yasos-v$pkgver-x86_64.tar.gz")
sha256sums=('a611021eb4918691b4c007fa88b8105b14acb4bb1fc72498543d93097379170b')

package() {
  cd "$srcdir/"

  install -Dm755 yasos "$pkgdir/usr/bin/yasos"

  install -Dm755 libys.so "$pkgdir/usr/lib/yslib/libys.so"

  install -d "$pkgdir/usr/include/ysinclude"
  install -Dm644 headers/*.ys "$pkgdir/usr/include/ysinclude/"


  install -d "$pkgdir/usr/include/ysinclude/c"
  install -m644 headers/c/* "$pkgdir/usr/include/ysinclude/c/"
}
