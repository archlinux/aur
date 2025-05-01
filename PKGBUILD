# Maintainer: Vladimir Romashchenko <eaglesemanation@gmail.com>
pkgname=displayconfig-mutter
pkgver=0.1.1
pkgrel=1
pkgdesc="Change Gnome display settings from cli"
arch=("x86_64" "aarch64")
url="https://github.com/eaglesemanation/${pkgname}"
license=("MIT")
makedepends=("rust" "cargo")
source=("git+https://github.com/eaglesemanation/${pkgname}.git#tag=v${pkgver}")
sha256sums=('b21943a6bbb727c7ddee0e57fbd58b8b334b26886d4a121aea879e7a3c6d781a')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/displayconfig-mutter \
    "$pkgdir/usr/bin/displayconfig-mutter"
}
