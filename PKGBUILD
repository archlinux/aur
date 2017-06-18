# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ion
pkgver=1.0.3
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux."
arch=("x86_64" "i686")
url="https://github.com/redox-os/ion"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/redox-os/ion/archive/$pkgver.tar.gz")
sha512sums=('132edc4afc161789b0a4036413686c2f41cfc0880e91c85577297059a23643aade9749f217c0bc2cbd6467c13fa729cdd95800c90980f1c2c4eac06b196906a9')

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
