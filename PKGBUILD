# Maintainer: Kayque Pereira kayquesousa02004@gmail.com
pkgname=minesweep-rs
pkgver=6.0.54
pkgrel=1
pkgdesc="Sweep some mines for fun, and probably not for profit."
arch=('x86_64')
url="https://github.com/cpcloud/minesweep-rs"
license=('Apache')
depends=('ncurses')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cpcloud/minesweep-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/minesweep-rs-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "$srcdir/minesweep-rs-${pkgver}"
  install -Dm755 "target/release/minesweep" "$pkgdir/usr/bin/minesweep"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
