# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket
pkgver=0.2.0
pkgrel=1
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('x86_64')
url="https://github.com/rafaelmardojai/blanket"
license=('GPL3')
depends=('gtk3' 'gst-python' 'python-gobject' 'libhandy1')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('74469e0f1fefff877414f09e43a94f272afe0913134afd95ba1052647db3728c')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
