# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pulldown-cmark
pkgver=0.1.0
pkgrel=1
pkgdesc='Pull parser for CommonMark, written in Rust'
arch=('x86_64')
url=https://github.com/google/pulldown-cmark
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('098608de00c986cbd08ed940829238c2534807be91a3c49c2fc6ee81bb5fa1005ae7cfff85657d8af1b0d53cf90087f49d58b64cb308abfda9384401814b6ee3')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
