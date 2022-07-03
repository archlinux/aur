# Maintainer: Niklas Fiekas <niklas at lichess.org>

pkgname=remote-uci
pkgver=1.0.0.alpha2
pkgrel=2
pkgdesc='Use external UCI engines for analysis on lichess.org'
arch=(any)
url=https://github.com/lichess-org/external-engine
license=(GPL3)
makedepends=(rust)
depends=(coreutils stockfish)
install=remote-uci.install
source=("git+$url#tag=v1.0.0-alpha.2")
sha256sums=(SKIP)

build() {
  cd external-engine/remote-uci
  cargo build --release
}

package() {
  install -Dm755 external-engine/remote-uci/target/release/remote-uci -t "$pkgdir/usr/bin"
  cp -R external-engine/remote-uci/usr "$pkgdir/"
}
