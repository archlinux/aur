# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=7.0.9
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('171a95f59c1c4c8bfb63c8e1a94d1b7d59fe5c495a043453ffa11a0735779a61a6cdba56d603aa509063a6113632664b25eab713e549ba607548c6cb1f3f2c85')
sha256sums=('38d0de118b18f4627ab0d16c12b3cdf320ae1353538455e29e57c32cfd29f63e')
sha1sums=('4bbcf2273a8f697da752032fd980c92ae1b73964')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
