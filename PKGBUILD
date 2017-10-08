# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ion
pkgver=1.0.5
pkgrel=2
pkgdesc="The Ion Shell. Compatible with Redox and Linux."
arch=("x86_64" "i686")
url="https://github.com/redox-os/ion"
license=('MIT')
makedepends=('cargo')
install=ion.install
source=("https://github.com/redox-os/ion/archive/$pkgver.tar.gz")
sha512sums=('eea20a23671101fa2589f71e954edeccec4066ae86321047e2409620b8362dac2638b5e0911fb42ec9cc3aaa584ff25d4b08a2ff46f6f3893c34e396886c7cff')

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
