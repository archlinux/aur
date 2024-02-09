# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=game-rs-git
_realname=game-rs
pkgver=r93.a2ddd77
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(git rust)
provides=("game-rs")
conflicts=("game-rs")
source=(git+https://github.com/amanse/game-rs)
sha256sums=('SKIP')

pkgver() {
  cd "$_realname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
   cd "$srcdir/$_realname"
   cargo install --path .
}

package() {
  cd "$srcdir/$_realname"
    install -Dm755 "target/release/game-rs" -t "$pkgdir/usr/bin/"
}
