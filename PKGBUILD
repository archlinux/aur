# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter
pkgver=0.1.8
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")
makedepends=("rust" "cargo")
source=("git+https://github.com/eaglesemanation/${pkgname}.git#tag=v${pkgver}")
sha256sums=('35fd6fa31cf69e6c612b9205a6ed02e690f4e152c9ed341306e5f74c36d29d70')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
