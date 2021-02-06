# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=ht-rs
_pkgname=ht
pkgver=0.4.0
pkgrel=1
pkgdesc='HTTPie clone implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/ducaale/ht"
license=('MIT')
makedepends=('cargo')
conflicts=('ht-bin')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c7e6ff620b3206b395b9b839950dd5ccd62820855eb6b1e4d401ac32b42aa4e')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
