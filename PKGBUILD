# Maintainer: David Husička <contact@bydave.net>

pkgname=uwuify
pkgver=0.2.1
pkgrel=1
pkgdesc="fastest text uwuifier in the west"
arch=('x86_64')
url="https://github.com/Daniel-Liu-c0deb0t/uwu"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Daniel-Liu-c0deb0t/uwu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("40089a349c3485e7dedfb00bfd0b1f128b0a7bc709121cc3a001e6c56df9163b")

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
