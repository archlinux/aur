# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs
pkgver=0.1.4
pkgrel=1
pkgdesc='Unbound local-data generator for curated hosts files'
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(rust)
optdepends=('sudo: to write to destination as unprivileged user')
conflicts=(tenshi-rs-git)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('a727d23f292d38a55102d0df1e82bed3fdb4171b434ac1d1f4ca02846e5d6263ded9ae2c760f1022256a6f9df7881ffb7b8d6be5c1302b2d74d3f56f1cdb7abb')

build() {
  cd tenshi-$pkgver
  cargo build --release
}

package() {
  cd tenshi-$pkgver
  install -D target/release/tenshi "$pkgdir"/usr/bin/tenshi-rs
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tenshi-rs
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tenshi-rs
}
