# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.0.16
pkgrel=2
pkgdesc='CLI to save web pages as single HTML files'
arch=(i686 x86_64)
url=https://github.com/Y2Z/monolith
license=(custom)
depends=(openssl)
makedepends=(cargo)
provides=(monolith)
conflicts=(monolith)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('33f554cde4305ae9d01461edd7fadf16aba2ad6bd57f3af321a847314621006c11fb338ebce347c24d9cdc840d49dee89ba134c6c2a6a8bac3e0ac98be489a19')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -D target/release/monolith -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
