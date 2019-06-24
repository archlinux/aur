# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=tenshi-rs
pkgver=0.2.2
pkgrel=2
pkgdesc='Unbound local-zone generator for curated hosts files'
arch=(aarch64 armv6h armv7h i686 x86_64)
url=https://github.com/flacks/tenshi
license=(GPL3)
makedepends=(cargo)
optdepends=('sudo: to write to destination as another user')
source=($url/archive/$pkgver.tar.gz)
sha512sums=('cc5536f12af71a3f0df8fac7f754eba2ff35e13083815bf309f81775065ff20bc5d02baa0b95194009201a94b00c95c28783511f170befb7cc13fd2f55e9aa1d')

build() {
  cd tenshi-$pkgver
  cargo build --release
}

package() {
  cd tenshi-$pkgver
  install -D target/release/tenshi -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/tenshi
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/tenshi
}
