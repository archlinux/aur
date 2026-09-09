# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=oklch-color-picker
pkgver=2.4.1
pkgrel=1
pkgdesc="A standalone color picker application using the Oklch colorspace (based on Oklab)"
url="https://github.com/eero-lehtinen/oklch-color-picker"
license=('MIT')
arch=('x86_64')
depends=('libglvnd' 'libxkbcommon')
makedepends=('rust')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('0e6b5d9c2b2d9020085573a7b5d63b104418c01236ebd3c982fa7b2d94de79dee128f49b1727d2b2b25b6c9fd4f2861308bb8f7e83626a38da168255a0c8ee94')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
