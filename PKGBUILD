# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter
pkgver=0.1.3
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")
makedepends=("rust" "cargo")
source=("git+https://github.com/eaglesemanation/${pkgname}.git#tag=v${pkgver}")
sha256sums=('e9def39684c0a840453b817c7dd847c1acd8da5f509bca17f9dcea9a5c06250a')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
