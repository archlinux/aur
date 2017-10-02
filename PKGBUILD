# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-benchcmp
pkgver=0.2.0
pkgrel=1
pkgdesc="A small utility to compare Rust micro-benchmarks"
url="https://github.com/BurntSushi/cargo-benchcmp"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h')
license=('MIT' 'UNLICENSE')
source=("$pkgname-$pkgver.tar.gz::https://github.com/BurntSushi/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('d6e1f54d84af202e7ce4807bcfdb78053e33066a33dc3a803cba75f591441cbe')
sha512sums=('b4b41b929cabb0d0c5e885395ba4d1c87524854c7c5680013f0cda8f9dd80c7c4faab768ca443c29132d8cb383b57f9dec84a4a476bf414198c34c4f7f8b12ab')

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
