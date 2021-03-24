# Maintainer: David Husička <contact@bydave.net>

pkgname=uwuify
pkgver=0.1.0
pkgrel=1
pkgdesc="fastest text uwuifier in the west"
arch=('x86_64')
url="https://github.com/Daniel-Liu-c0deb0t/uwu"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Daniel-Liu-c0deb0t/uwu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("ccccaaf60aee39ef1acc864262656316448a3c6dfa3aa882b1a9a67d77f4b7c6")

build() {
  cd "uwu-$pkgver"

  cargo build --release --locked
}

check() {
  cd "uwu-$pkgver"

  cargo test --release --locked
}

package() {
  cd "uwu-$pkgver"

  install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
