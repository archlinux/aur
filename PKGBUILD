# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=oklch-color-picker
pkgver=2.3.4
pkgrel=1
pkgdesc="A standalone color picker application using the Oklch colorspace (based on Oklab)"
url="https://oklch.eerolehtinen.fi/"
license=('MIT')
arch=('x86_64')
depends=('libglvnd' 'libxkbcommon')
makedepends=('rust')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('1ef1709f763476ff4bd60c60866151f4b7be1fd34961a8b22fb6819c0565a2582ebfbbd5ebaac660d90630d9cd75cabcc31e6443ac5c7cb9b00777898018dc91')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
