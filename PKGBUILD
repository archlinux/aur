# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ion
pkgver=1.0.4
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux."
arch=("x86_64" "i686")
url="https://github.com/redox-os/ion"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/redox-os/ion/archive/$pkgver.tar.gz")
sha512sums=('3c0f81ef5719c21ff4e392a7ffffb39c9f7b37b3449dd78890740e310e502523b506680cd73d073726893c7397fff9638973164108186ce6fd33b6481709cf4d')

build() {
  cd $srcdir/$pkgname-$pkgver
  cargo build --release
}

check() {
  cd $srcdir/$pkgname-$pkgver
  cargo test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm755 target/release/ion $pkgdir/usr/bin/ion
}
