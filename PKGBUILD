# Maintainer: kpcyrd <git@rxv.cc>

pkgname=cargo-vendor
pkgver=0.1.15
pkgrel=1
pkgdesc="Cargo subcommand to vendor crates.io dependencies"
url="https://github.com/alexcrichton/cargo-vendor"
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT' 'APACHE')
source=("https://github.com/alexcrichton/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4094771f3dc3e0bfe6e389c6a8cbb5ffb95758cf340726fc8cec827cd0ef2d49')
sha512sums=('a3068cea2edc002f8ef65c3e9c09c49afbcb965e0fc3ef449a0e539ef967aa8508e070aa1183362f165fbe4b640623c92b238061dd2ffb6b253ba4959281bba5')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
