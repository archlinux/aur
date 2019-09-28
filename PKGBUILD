# Maintainer: Anton Leontiev <scileont /at/ gmail dot com>
pkgname=gst-devtools
pkgver=1.16.1
pkgrel=1
pkgdesc='Development and debugging tools for GStreamer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://gitlab.freedesktop.org/gstreamer/gst-devtools'
license=('LGPL')
makedepends=('meson')
depends=("gstreamer>=$pkgver")
source=(https://gitlab.freedesktop.org/gstreamer/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('32bef0d8e88baa45c7ab1c18aa9a837d2246b9978be93b2c37d0c1cfa88688f5')

build() {
	meson --prefix /usr --buildtype plain $pkgname-$pkgver build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
