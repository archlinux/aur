# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=ht-rs
_pkgname=ht
pkgver=0.4.0
pkgrel=2
pkgdesc='HTTPie clone implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/ducaale/ht"
license=('MIT')
makedepends=('cargo')
conflicts=('ht-bin')
install=ht-rs.install
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "$pkgname".install)
sha256sums=('5c7e6ff620b3206b395b9b839950dd5ccd62820855eb6b1e4d401ac32b42aa4e'
            '11d2c4f07a31c869ac64f25f0189c455e244c5ae883fcf5dcdebb103cc7f0995')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$pkgname"
}
