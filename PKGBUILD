# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=game-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(rust)
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('6a8c31095ab90f5fc64779ba625c26b12e410ebf62ed9d11cd6ff4896bc623b8')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   cargo install --path .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
