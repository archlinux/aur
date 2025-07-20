# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter
pkgver=0.1.6
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")
makedepends=("rust" "cargo")
source=("git+https://github.com/eaglesemanation/${pkgname}.git#tag=v${pkgver}")
sha256sums=('b13de0b237e370c73f321905a35fd5f39ddeef7d3a11a63a6261e11c843276fc')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
