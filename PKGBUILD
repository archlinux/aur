# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=swayhide
pkgver=0.2.0
pkgrel=1
pkgdesc="Window swallower for swaywm"
url="https://github.com/NomisIV/swayhide"
license=("ISC")
arch=("x86_64" "aarch64")
makedepends=("rust")
depends=("sway")
source=("https://github.com/NomisIV/swayhide/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7d9e8e5fbd75a87497ca64dbeea1775c97457717da2e35357ff79f78ddd32d54')

# build() {
#   cd "$srcdir/$pkgname-$pkgver"
#
#   cargo build --release
# }
#
package() {
  cd "$srcdir/$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
}
