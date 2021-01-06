# Maintainer: Anton Leontiev <scileont /at/ gmail dot com>
pkgname=gst-devtools
pkgver=1.18.2
pkgrel=1
pkgdesc='Development and debugging tools for GStreamer'
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url='https://gitlab.freedesktop.org/gstreamer/gst-devtools'
license=('LGPL')
makedepends=('meson')
depends=("gstreamer>=$pkgver")
source=(https://gitlab.freedesktop.org/gstreamer/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8e414f8f59875bfdf366848fb5224cea9eefab43505862b91b07c4e9e0d033c4')

build() {
	meson --prefix /usr --buildtype plain $pkgname-$pkgver build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
