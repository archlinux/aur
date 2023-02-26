# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=game-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(rust)
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/archive/refs/tags/auto.tar.gz)
sha256sums=('7db7ac6618e248415c9911db9d3221425cb50c8c02db77c699369296cba450ea')

build() {
   cd "$srcdir/$pkgname-auto"
   cargo install --path .
}

package() {
  cd "$srcdir/$pkgname-auto"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
