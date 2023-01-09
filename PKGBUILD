# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="yoku"
pkgver=0.1.2
pkgrel=0
pkgdesc="Markdown based TUI todo"
arch=('x86_64')
url="https://github.com/misobarisic/yoku"
license=('GPL3')
makedepends=('cargo' 'rust')
conflicts=('yoku' 'yoku-bin')
provides=('yoku')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/misobarisic/yoku/archive/v${pkgver}.tar.gz")
sha256sums=("0e33fc6f44ef79dc4e626ca8bebba29a41ecd751ffee67b7248d9da89f549569")

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
