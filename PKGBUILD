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
sha256sums=('641a064d354f061892df9409235659fab84955635c95ed679362409e40c663d6')
build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/rust-dwm-status "$pkgdir/usr/bin/rust-dwm-status"
}
