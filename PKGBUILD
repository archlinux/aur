# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=monolith
pkgver=2.3.1
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(Unlicense)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('b09c1dbad47fd0b34dffb0a9b38a72b54bff9dcc9420f8a4e5eb8aa1ac42632ab8fbd9b96080b852954df42dc2eb25aca3689956962711f7d321c58e79ade471')


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
