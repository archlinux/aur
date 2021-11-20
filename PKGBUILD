# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
pkgver=nightly
pkgrel=5
pkgdesc="config manager (simple impl of gun-stow)"
arch=('x86_64')
url="https://github.com/someoneonsmile/stow"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=('stow')
source=("stow-$pkgver.tar.gz::https://github.com/someoneonsmile/stow/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('SKIP')

build() {
  cd "stow-$pkgver"
  cargo build --release --target x86_64-unknown-linux-musl
}

package() {
  cd "stow-$pkgver"
  install -Dm755 "target/x86_64-unknown-linux-musl/release/stow" "$pkgdir/usr/bin/stow"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
