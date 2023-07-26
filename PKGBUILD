# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=game-rs
pkgver=0.1.3
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(rust)
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/archive/refs/tags/v$pkgver.tar.gz)

sha256sums=('981b4c47e4c6ab95da07aa55e45829db3c2e2b8c3adebe65dcd45da789b69b67')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   cargo install --path .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
