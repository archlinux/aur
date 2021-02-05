# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=cargo-lichking
pkgver=0.9.0
pkgrel=1
pkgdesc="Automated license checking for rust"
arch=(x86_64)
url=https://github.com/Nemo157/cargo-lichking
license=(Apache MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=(https://github.com/Nemo157/cargo-lichking/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('33a426e6a2a96252c083221353f0c66209548522e7b19548198dbb24efcad909')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --all --release --locked
}

package() {
  cd $pkgname-$pkgver
  install -Dm0755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

# vim: set ts=2 sw=2 et:
