# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=blanket
pkgver=0.4.0
pkgrel=2
pkgdesc="Improve focus and increase your productivity by listening to different sounds."
arch=('any')
url="https://github.com/rafaelmardojai/blanket"
license=('GPL3')
depends=('gtk3' 'gst-plugins-bad-libs' 'gst-python' 'python-gobject' 'libhandy')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('dc144634e83807b12ac9a2ceeb706816bfe3724c4218e87c63088d53a57fbcc3')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
