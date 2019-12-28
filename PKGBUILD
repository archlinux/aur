# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=monolith
pkgver=2.1.1
pkgrel=1
pkgdesc='CLI to save web pages as single HTML files'
arch=(x86_64 aarch64)
url=https://github.com/Y2Z/monolith
license=(custom:Unlicese)
depends=(openssl)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('d88553d5c7d93d960cb9c6e9410fb4e3409387c9c4676ced70d337252bb257e52972fc69e5d84a18ea74cbc0dd68633a8f121a12ad239dff013feb5cf483027f')

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
