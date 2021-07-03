# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>
# Contributor: Pig Monkey <pm@pig-monkey.com>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.6.0
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(CC0-1.0)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('8a6091f0569ffda4decb22033fd9bc04975f30c26df1790b65b8466442252162861a4be2c57c388e8c4c0b9ee55d16bf6c202089d8218e56459ae0ff0aa4c497')


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
