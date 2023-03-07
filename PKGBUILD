# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=game-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(rust)
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('54b90a546ca445b96811ddf8814d2771e8347325c42459be08b67684a0599954')


build() {
   cd "$srcdir/$pkgname-$pkgver"
   cargo install --path .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
