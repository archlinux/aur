# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ion
pkgver=1.0.1
_commit=fd9389f9527e6ef6b5a9a053541f097e5798bc8f
pkgrel=1
pkgdesc="The Ion Shell. Compatible with Redox and Linux."
arch=("x86_64" "i686")
url="https://github.com/redox-os/ion"
license=('MIT')
makedepends=('cargo')
source=("https://github.com/redox-os/ion/archive/$_commit.tar.gz")
sha512sums=('0f37107635a9998f72f7b256107dd30058ef4445e019153cdb0a6bbac09b7926c54d1a26ebbf835a0b9f403224a566767aac5189e4de20bed00c4db6edb7641e')

build() {
  cd $srcdir/$pkgname-$_commit
  cargo build --release
}

check() {
  cd $srcdir/$pkgname-$_commit
  cargo test
}

package() {
  cd $srcdir/$pkgname-$_commit
  install -Dm755 target/release/ion $pkgdir/usr/bin/ion
}
