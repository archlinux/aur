# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=globe-cli
_pkgname=globe
pkgver=0.1.1
pkgrel=1
pkgdesc="ASCII globe generator"
arch=('x86_64')
url="https://github.com/adamsky/globe"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('361c68819be14314cb289bc7ca9ba18539660c8a51d8003017ece45f78a6b0a77fc396241dd45f7881bd423796f3ac5d0fd26bc54a5e4287dec6820277fd30b9')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
