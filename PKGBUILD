# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=i3-workspace-brightness
pkgver=1.0.2
pkgrel=1
pkgdesc="Utility to auto-adjust the brightness of i3wm workspaces"
arch=('x86_64')
url="https://github.com/orhun/i3-workspace-brightness"
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('7e0e52c0af16c2a8374b91a4a2ca3e48c3c6d0bfe4c811d60095ebc12e5f7862a43141b16ccf1b04901c09282379650009ad981d3f9a1fd9c250cca1738cc7a1')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
