# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter
pkgver=0.1.2
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")
makedepends=("rust" "cargo")
source=("git+https://github.com/eaglesemanation/${pkgname}.git#tag=v${pkgver}")
sha256sums=('5f863c491ecda712ee57a5a42614f8e85174ff24513bdf59012801eea74bdd43')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
