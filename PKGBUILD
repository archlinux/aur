pkgname=retrobyte
pkgver=1.1
pkgrel=3
pkgdesc="A retro terminal-based game collection: ArchSnake, Brickfall, and ArcadePong"
arch=('x86_64')
url="https://github.com/KOrtizLedezma/Retrobyte.git"
license=('MIT')
depends=('ncurses')
makedepends=('gcc' 'make')
source=("retrobyte-1.1.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
