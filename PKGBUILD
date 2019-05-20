# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs
pkgver=0.2.1
pkgrel=2
pkgdesc='Unbound local-zone generator for curated hosts files'
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(rust)
optdepends=('sudo: to write to destination as another user')
conflicts=(tenshi-rs-git)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('b5affe3b5cae81e9359c7e7a5a516b7e80e2a0e115f82a9aef29b5a934e5482d7ec5aea321367aa26bc7c19ae0d2ffb05253d5ea4767dd08bf4f87283bb87fcd')

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
