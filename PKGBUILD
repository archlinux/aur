pkgname=yasos-bin
pkgver=20260315
pkgrel=1
pkgdesc="Compiler for the Yasos programming language (binary release)"
arch=('x86_64')
url="https://github.com/DameChocolateYa/yasos"
license=('BSD')
depends=('llvm')
provides=('yasos')
conflicts=('yasos-git')

source=("https://github.com/DameChocolateYa/yasos/releases/download/v$pkgver-$pkgrel/yasos-linux-$pkgver-x86_64.tar.xz")
sha256sums=('b93302646cc391a6384e484f6a69b163492365cc669999a8deebf9adb454229a')

package() {
  cd "$srcdir/yasos"

  install -Dm755 yasos "$pkgdir/usr/bin/yasos"

  install -Dm755 libys.so "$pkgdir/usr/lib/yslib/libys.so"

  install -d "$pkgdir/usr/include/ysinclude"
  install -Dm644 headers/* "$pkgdir/usr/include/ysinclude/"
}
