# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>
# Contributor: Pig Monkey <pm@pig-monkey.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.6.2
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(CC0-1.0)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('47e3155fb6b28b5727536e049743ec80fece65111d17303904779b77260a6a1f483e9ef13edee466fe0e7809e18d510cef1dfd6a7501415b132eb9fe8c78971a')


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
