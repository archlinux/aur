# Maintainer: kpcyrd <git@rxv.cc>

pkgname=sn0int-registry
pkgver=0.1.0
pkgrel=1
pkgdesc="sn0int registry"
url="https://github.com/kpcyrd/sn0int"
depends=('curl' 'postgresql-libs')
makedepends=('rustup')
arch=('i686' 'x86_64')
license=('GPL-3')
source=("https://github.com/kpcyrd/sn0int/archive/v$pkgver/sn0int-$pkgver.tar.gz")
sha256sums=('73e81ab111d3c269bc94803da75c5dea7c9e613d584995352e1b8eabc9a372c6')

build() {
  cd "sn0int-$pkgver/sn0int-registry"
  cargo build --release --locked
}

check() {
  cd "sn0int-$pkgver/sn0int-registry"
  cargo test --release --locked
}

package() {
  cd "sn0int-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
