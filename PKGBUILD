# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>
# Contributor: Pig Monkey <pm@pig-monkey.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.5.0
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(CC0-1.0)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('845932aa8abcf305e97fbb3edc4fe4d2909db9ad024307676e9454814fca94a289c8fdbb15a4a37d4f037dc443ad970be7287ebdfbb33816f94916d43d30c959')


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
