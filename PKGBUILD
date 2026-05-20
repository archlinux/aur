# Maintainer: w1zx1
pkgname=screentaker
pkgver=0.1.0
pkgrel=1
pkgdesc="a lightweight and reliable screenshooter for X11 written in Rust"
arch=('x86_64')
options=('!debug')
url="https://aur.archlinux.org/packages/screentaker"
license=('MIT')
makedepends=('rust')
source=()
md5sums=()

build() {
  cd "$srcdir/.."
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/../target/release/screentaker" "$pkgdir/usr/bin/screentaker"
  install -Dm644 "$srcdir/../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/../README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
