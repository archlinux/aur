# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=imeditor
pkgver=0.9.3
pkgrel=2
pkgdesc="Simple & versatile image editor."
arch=('any')
url="https://imeditor.github.io"
license=('GPL3')
depends=('gtk3' 'python-pillow')
makedepends=('meson' 'appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ImEditor/ImEditor/archive/$pkgver.tar.gz")
sha256sums=('50d82c3e01d5ca0ff36d0b989c8d38b42b9de62176960ac7acca0b117aa2602d')

build() {
	cd "ImEditor-$pkgver"
	arch-meson _build
	ninja -C _build
}

package() {
	cd "ImEditor-$pkgver"
	DESTDIR="$pkgdir" ninja -C _build install
}
