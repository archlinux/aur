# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=rusty-krab-manager
pkgver=1.1.3
pkgrel=1
pkgdesc="Time management TUI"
arch=('x86_64')
url="https://github.com/aryakaul/rusty-krab-manager"
license=('custom')
makedepends=('cargo' 'alsa-lib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e0067e213f32c5606762faf38b2ce81b5712d61e5b167b099be8d04ef604d1a68fb9eafcef102986819fc3a6471cfd084e38cb96135a2f07f64db64161e2552a')

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
