pkgname=sudoku-tui
_pkgsrc=sudoku
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal Sudoku game written in Go with Bubble Tea"
arch=('x86_64')
url="https://github.com/Terabit-off/sudoku"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$_pkgsrc-$pkgver.tar.gz::https://github.com/Terabit-off/sudoku/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgsrc-$pkgver"
  go build -trimpath -ldflags="-s -w" -o "$pkgname" .
}

package() {
  cd "$srcdir/$_pkgsrc-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}