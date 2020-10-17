# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rusty-krab-manager
pkgver=1.0
pkgrel=1
pkgdesc="Time management TUI"
arch=('x86_64')
url="https://github.com/aryakaul/rusty-krab-manager"
license=('custom')
makedepends=('cargo' 'alsa-lib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7e66b5366386d89cbd4038579e0cc16d401489a30baaaeee6180dd495d6890f5a9486a52dd6203a3d18bb3ba6c4e8ee331c4a962632c7cec7d025dceea28b45c')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
