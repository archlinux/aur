# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>
# Contributor: Pig Monkey <pm@pig-monkey.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.7.0
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(CC0-1.0)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('c3cd758990999790981d89bd0e81872107b9199cdc3d9a2059e129b426220d8a989582d6ef9e23351ad0f1352c083628090832ab368d37e39d313f2a18880d3e')


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
