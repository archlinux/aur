# Maintainer: gbr <gbr@protonmail.com>

pkgname=sfz
pkgver=0.1.2
pkgrel=1
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
url=https://github.com/weihanglo/sfz
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0fa6988620c5e7b761dd3c3344575c05f5810a9085816eee80ddd725198d14541517e20aaebc3248227c62c0c6f5f2aec2a014cabe93f21d31982d84f917fecc')

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

