# Maintainer: Anton Leontiev <scileont /at/ gmail dot com>
pkgname=gst-devtools
pkgver=1.16.2
pkgrel=1
pkgdesc='Development and debugging tools for GStreamer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://gitlab.freedesktop.org/gstreamer/gst-devtools'
license=('LGPL')
makedepends=('meson')
depends=("gstreamer>=$pkgver")
source=(https://gitlab.freedesktop.org/gstreamer/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('553677963cd5970ba507bf7f5208b5d6b4230a94e1bdc960709352777e68ec42')

build() {
	meson --prefix /usr --buildtype plain $pkgname-$pkgver build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
