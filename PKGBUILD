# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=ht-rs
_pkgname=ht
pkgver=0.3.2
pkgrel=1
pkgdesc='HTTPie clone implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/ducaale/ht"
license=('MIT')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0d905d7030b4f134eee24f1661ad36c1878cdd256fac9c5065704ea0d3314770')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
