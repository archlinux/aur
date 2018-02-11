# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-benchcmp
pkgver=0.3.0
pkgrel=1
pkgdesc="A small utility to compare Rust micro-benchmarks"
url="https://github.com/BurntSushi/cargo-benchcmp"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'UNLICENSE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BurntSushi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5e47bc72ccce55308b2f9398f0ee9836ff129708f530f71ed9814fa2605ed517')
sha512sums=('4a92a3b30c5782ead47258364c318ec6554f4145063c6a35ffd6968b889f785349fecdbcee4bf7acf93ed2897f01322cde3f9a779c7dda15a8d7608b722dd169')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}

# vim:set ts=2 sw=2 et:
