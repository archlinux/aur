# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.1.0
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('x86_64')
url="https://github.com/hugolabe/Wike"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('937b67d3b90b6442f1e9081a17f92bf12bc9a32ee6553efdf3f8528a5ea570b0')

build() {
	arch-meson Wike-$pkgver build
	meson compile -C build
}

#check() {
#	meson test -C build
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
