# Maintainer: Anton Leontiev <scileont /at/ gmail dot com>
pkgname=gst-devtools
pkgver=1.18.4
pkgrel=1
pkgdesc='Development and debugging tools for GStreamer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://gitlab.freedesktop.org/gstreamer/gst-devtools'
license=('LGPL')
makedepends=('meson')
depends=("gstreamer>=$pkgver")
source=(https://gitlab.freedesktop.org/gstreamer/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('0f886306c7588927b55b8e4359de79c9056d549c902ae6a29406d36836989095')

build() {
	meson --prefix /usr --buildtype plain $pkgname-$pkgver build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
