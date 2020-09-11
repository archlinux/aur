# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket
pkgver=0.3.0
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('x86_64')
url="https://github.com/rafaelmardojai/blanket"
license=('GPL3')
depends=('gtk3' 'gst-python' 'python-gobject' 'libhandy1')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a5449227fd2e7de0711fc787a10ad93b8248b2e9fa1a6981b3a278e51d5aa51b')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
