# Maintainer: deutereum <fawwazzuladhim700@gmail.com>

pkgname=fanmon
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal ASCII fan monitor based on NBFC"
arch=('x86_64')
url="https://github.com/Izuree/fanmon"
license=('MIT')
depends=('nbfc')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/fanmon "$pkgdir/usr/bin/fanmon"
}
