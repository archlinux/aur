# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=odroid-c2-bridge
pkgver=0.6
pkgrel=2
pkgdesc="Simple method to create a bridge for the ODROID-C2"
arch=('any')
url="https://github.com/graysky2/odroid-c2-bridge"
license=('MIT')
depends=('iproute2' 'bridge-utils')
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f81edd2e59be3827be01917d98d4dfe3c972ae2de0244886ceba61436b2f5568')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
