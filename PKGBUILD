# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=wike
pkgver=1.2.0
pkgrel=1
pkgdesc="Wikipedia Reader for the GNOME Desktop"
arch=('x86_64')
url="https://github.com/hugolabe/Wike"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-requests' 'webkit2gtk')
makedepends=('meson')
#checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4e7f454377e109a0fd1a5404f153f63efca55c1a71f9ca976ace28798abb1621')

build() {
	arch-meson Wike-$pkgver build
	meson compile -C build
}

#check() {
#	meson test -C build --print-errorlogs
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
