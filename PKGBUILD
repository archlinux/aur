# Maintainer: Sauyon Lee <aur at sjle.co>
pkgname=bin
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A paste bin written in Rust."
arch=('i686' 'x86_64')
url=""
license=('WTFPL')
groups=()
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/w4/bin/archive/v${pkgver}.tar.gz")
sha256sums=('c4f01275fc56e4ef7a61897fb18f9b09ff3cd8dbc2d475c09d7565b83b8370d3')
noextract=()
build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo update
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 ./target/release/bin "$pkgdir/usr/bin/bin"
}

# vim:set ts=2 sw=2 et:
