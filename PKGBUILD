# Maintainer: gbr <gbr@protonmail.com>

pkgname=sfz
pkgver=0.0.4
pkgrel=1
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
url=https://github.com/weihanglo/sfz
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('4d385e82175b8033fe8d042e42d19b15fb880d022454751dd0302ddf49d3f9bbae8eb36750d6f2f9621582983ef6a2f3d0c3dd47715b8f9e3a01589e7bcba99e')

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
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

