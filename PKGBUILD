# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=game-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(rust)
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/archive/refs/tags/v$pkgver.tar.gz)

sha256sums=('710a95ce5aa8fa9bb110fae9654b542c97b98cbab30be8fc57f8c7ae48a4307e')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   cargo install --path .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}
