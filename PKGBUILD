# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs
pkgver=0.1.3
pkgrel=1
pkgdesc='Unbound local-data generator for curated hosts files'
arch=(aarch64 arm armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(rust)
optdepends=('sudo: to write to destination as unprivileged user')
conflicts=(tenshi-rs-git)
source=($url/archive/$pkgver.tar.gz)
sha512sums=('ed875745a33d194815195ae68c5916eef2210ce312e344f85d72764cc3d16e6606a854997665145f50c9d0c8a601c88130e30bef0602c16b5affb60d28ab06b7')

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
