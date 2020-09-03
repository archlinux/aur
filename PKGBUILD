# Maintainer: gbr <gbr@protonmail.com>

pkgname=sfz
pkgver=0.2.1
pkgrel=1
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
url=https://github.com/weihanglo/sfz
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('481a14fc8105767cb73f8a07e6d8f428325d4272f0fd78477ab83fac0e5b38c3db03b2ea0ebf92556a6a34c0131046398b823f72cf9fd84c94c8857d32b78045')

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

