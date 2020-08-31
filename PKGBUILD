# Maintainer: gbr <gbr@protonmail.com>

pkgname=sfz
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple static file serving command-line tool written in Rust'
arch=('x86_64')
url=https://github.com/weihanglo/sfz
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7f15c97cca56b53ea9c8bd6f6aa456b037eadf1886fce42023fa1c5b5400808e9b47dab1fd53e82e3beed1d7b06da2359d6b70f972d05d0d3384d5160f927aca')

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

