# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ion
pkgver=1.0.2
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux."
arch=("x86_64" "i686")
url="https://github.com/redox-os/ion"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/redox-os/ion/archive/$pkgver.tar.gz")
sha512sums=('9f78ceab9fd0fa454582eede84f84914d72c37a75530a338ae6d5ac8f16c8cb136b353d9d9c4f8331c7a047e24ea368171875b86bb12c921a3660da2f76c0f40')

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
