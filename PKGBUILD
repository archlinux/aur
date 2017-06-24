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
sha256sums=('40023afb8b1b06d897545035ea2488ba1637e5595caa4c1f867de283b04ba6b4')
build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 target/release/rust-dwm-status "$pkgdir/usr/bin/rust-dwm-status"
}
