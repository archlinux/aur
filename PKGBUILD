# Maintainer: Daniel Zierl danikpapas@email.cz
pkgname=tally-counter
pkgver=1.0
pkgrel=1
pkgdesc="Minimalistic tally counter for terminal written in rust"
url="https://gitlab.com/danielzierl/tally-counter"
arch=('x86_64')
license=('Apache')
depends=('rust' 'cargo')
source=("git"+$url.git)
sha256sums=('SKIP')
options=(!debug)

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}
package() {
  cd "$srcdir/$pkgname/target/release"
  install -Dm755 "tally-counter" "$pkgdir/usr/bin/tally-counter"
}
