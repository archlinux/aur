# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
pkgver=0.5.0
pkgrel=1
pkgdesc='Terminal theme editor with live preview'
arch=('x86_64')
url='https://github.com/MikkelKappelPersson/huebox'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('87fb37b4936fa844db24eecd6b246b4cdbc32c8180f14ad00c344c2f1f562fac')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --manifest-path rust/Cargo.toml
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 rust/target/release/huebox "$pkgdir/usr/bin/huebox"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
