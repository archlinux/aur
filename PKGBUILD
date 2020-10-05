# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket
pkgver=0.3.1
pkgrel=2
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('x86_64')
url="https://github.com/rafaelmardojai/blanket"
license=('GPL3')
depends=('gtk3' 'gst-python' 'python-gobject' 'libhandy')
makedepends=('meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('79942ed919507c0078266d221c433ba9209f8ea5f11371d55d64bd3b469623bf')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
