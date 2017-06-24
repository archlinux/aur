#Maintainer: Pierre Chevalier <pierrechevalier83@gmail.com>

pkgname=rust-dwm-status
_pkgname=rust-dwm-status
pkgver=0.5.0
pkgrel=1
pkgdesc="A status bar for tiling window managers with pretty unicode symbols written in rust"
url="https://github.com/pierrechevalier83/rust-dwm-status"
makedepends=('cargo')
depends=('xorg-xsetroot')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$_pkgname/$pkgver/download")
sha256sums=('6fe88c88af28269e21779517bbdc9e9f43c8752ac5abe086e58cfec7a30e580e')
build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/rust-dwm-status "$pkgdir/usr/bin/rust-dwm-status"
}
