#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=rust-dwm-status
_pkgname=rust-dwm-status
pkgver=0.3.1
pkgrel=1
pkgdesc="A status bar for tiling window managers with pretty unicode symbols written in rust"
url="https://github.com/pierrechevalier83/rust-dwm-status"
makedepends=('cargo')
depends=('xorg-xsetroot')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('f129d46ea76a52918fbc60612978a75ea7be2e5f30dbf8812640d764f82b6e8a')
build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/rust-dwm-status "$pkgdir/usr/bin/rust-dwm-status"
}
