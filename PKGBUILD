# Maintainer: kuisux <kui@eeu.jp>
pkgname=askyy
pkgver=0.1.0
pkgrel=1
pkgdesc="A sparkly ASCII night sky screensaver for your terminal"
arch=('x86_64')
url="https://github.com/kuisux/askyy"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "askyy-$pkgver"
  cargo build --release --locked
}

package() {
  cd "askyy-$pkgver"
  install -Dm755 "target/release/askyy" "$pkgdir/usr/bin/askyy"
}
