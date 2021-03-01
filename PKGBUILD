# Maintainer: Jean Lucas <jean@4ray.co>
# Maintainer: Pig Monkey <pm@pig-monkey.com>
# Maintainer: Chris Hillenbrand <chillenb.lists@gmail.com>

pkgname=monolith
pkgver=2.4.0
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(Unlicense)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('2538e0b241f56e4fee77df5ca05184ff67fa48b58324fb34793575ca9618c8c2310a0f71a0da4fa39cd456cdf1bfc1ac056c493c6f8e1ad1b464637fc6e5636e')


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
