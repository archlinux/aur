# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs
pkgver=0.2.0
pkgrel=1
pkgdesc='Unbound local-zone generator for curated hosts files'
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(rust)
optdepends=('sudo: to write to destination as superuser')
conflicts=(tenshi-rs-git)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('0400b6227f167c0585417f83440fea1ea89938e64addffe6fda10b99d04c1d05d1bbfd0f53573c4d8687098072ede1f74d7a39b90f61277e68f6bb45b1e1a491')

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
