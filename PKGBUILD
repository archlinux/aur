# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imeditor
pkgver=0.9.5
pkgrel=2
pkgdesc="Simple & versatile image editor."
arch=('any')
url="https://imeditor.github.io"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-pillow')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ImEditor/ImEditor/archive/$pkgver.tar.gz")
sha256sums=('7261fd8cfa7592d3f812af7a8b7ee39c73404827deaf20bfa19378b9f1371617')

build() {
	arch-meson ImEditor-$pkgver build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
