# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: Pig Monkey <pm@pig-monkey.com>

pkgname=monolith
pkgver=2.1.2
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(Unlicense)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('fedaa19b8f0e508ee5864c5228b00720b1535d91ef8b4a48e50b7ed65ca672310d8086ad3d9d467087772ce8a031283ddc0a19249a47da5fd551c52f358231a6')


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
