# Maintainer: gbr <gbr@protonmail.com>

pkgname=sfz
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
url=https://github.com/weihanglo/sfz
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a65e8e6e69612b925bf116d7665c7bad676e82e254c1a1b5a4fea363ff5ee854c45c2d9b05cfcdfa96fb77dc0e765236cf12fb855f025f3eca62e13aaab2b6d8')

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

