# Maintainer: kpcyrd <git@rxv.cc>

pkgname=progpick
pkgver=0.1.0
pkgrel=1
pkgdesc="Bruteforce with a stream of permutations of a specific pattern"
url="https://github.com/kpcyrd/progpick"
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
license=('GPL3')
source=("https://github.com/kpcyrd/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('37d3f1db4d64ce16374b2c5ee40f0e094174bdbfb3dd489a9924593ec23a8e52508dc9bf18df919dd7db757a633ad32b64e3466c1232609e42ae40eec56a5eb3')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
