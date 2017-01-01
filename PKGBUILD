# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=odroid-c2-bridge
pkgver=0.6
pkgrel=1
pkgdesc="Simple method to create a bridge for the ODROID-C2"
arch=('any')
url="https://github.com/graysky2/odroid-c2-bridge"
license=('MIT')
depends=('iproute2' 'bridge-utils')
source=("https://github.com/graysky2/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('624f1a5027bc4224211b933050db6a6e66ed5b7d3a4669e88538e7130786c872')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  install -Dm644 MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
