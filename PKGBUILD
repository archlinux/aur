# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="yoku"
pkgver=0.1.1
pkgrel=0
pkgdesc="Markdown based TUI todo"
arch=('x86_64')
url="https://github.com/misobarisic/yoku"
license=('GPL3')
makedepends=('cargo' 'rust')
conflicts=('yoku' 'yoku-bin')
provides=('yoku')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/misobarisic/yoku/archive/v${pkgver}.tar.gz")
sha256sums=("61ad230c25b6cc44311c8a1c4ba274d8b616ab5ac74d561a95a42d888b7957a1")

build() {
  mv $srcdir/$pkgname-$pkgver $srcdir/$pkgname
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cp "target/release/yoku" "$pkgdir/usr/bin"
}
