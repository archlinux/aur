# Maintainer: Mišo Barišić <me@misobarisic.com>
pkgname="yoku"
pkgver=0.1.0
pkgrel=2
pkgdesc="Markdown based TUI todo"
arch=('x86_64')
url="https://github.com/misobarisic/yoku"
license=('GPL3')
makedepends=('cargo' 'rust')
conflicts=('yoku' 'yoku-bin')
provides=('yoku')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/misobarisic/yoku/archive/v${pkgver}.tar.gz")
sha256sums=("10cb7b993794f2e2c16d2de71d4dcbc58a6fa6821e287df04fbca3a62731185f")

build() {
  cd "$srcdir/$_pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cp "target/release/yoku" "$pkgdir/usr/bin"
}
