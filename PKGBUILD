# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs
pkgver=0.2.1
pkgrel=1
pkgdesc='Unbound local-zone generator for curated hosts files'
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(rust)
optdepends=('sudo: to write to destination as another user')
conflicts=(tenshi-rs-git)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('bc6aa36a89d487b5799cef52346d3597cc0eaa785b4a9911d44bdb993975c827bf4afd74d03d9e83f134456db516b1278ab0467f6a45b00c82cbcf5f62931cf4')

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
