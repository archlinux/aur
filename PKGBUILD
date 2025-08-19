# Maintainer: Arda Yılmaz <fijarom at fijarom dot com>

pkgname=fokus
pkgver=2.0.3
pkgrel=1
pkgdesc="A minimalist terminal‐based focus timer and stopwatch with daily logging, built in Rust"
arch=('x86_64')
url="https://sr.ht/~fijarom/fokus/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust')

source=("git+https://git.sr.ht/~fijarom/fokus")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo update
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

