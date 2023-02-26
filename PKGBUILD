# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=game-rs-git
_realname=game-rs
pkgver=0.1.0
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

# I will update the pkgver as soon as the developer adds a tag to the release.

#pkgver() {
#  cd "$srcdir/$_realname"
#  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
   cd "$srcdir/$_realname"
   cargo install --path .
}

package() {
  cd "$srcdir/$_realname"
    install -Dm755 "target/release/game-rs" -t "$pkgdir/usr/bin/"
}
