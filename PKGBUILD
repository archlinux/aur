# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason Wood <jwood@startmail.com>

pkgname=gtkeddit
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK4 Reddit client"
arch=('x86_64')
url="https://gitlab.com/caveman250/gtkeddit"
license=('GPL3')
depends=(
	'gtkmm-4.0'
	'libmicrohttpd'
	'jsoncpp'
	'libxml2'
	'ffmpeg'
	'gstreamer'
	'gst-plugins-base'
	'gst-plugins-good'
	'gst-plugins-bad'
	'youtube-dl'
	'websocketpp'
	'libadwaita'
	'libsecret'
)
makedepends=('cmake' 'boost')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/Gtkeddit-$pkgver.tar.gz")
sha256sums=('f291d62812a6d5ed763d57f80ee9e734fde133927f7526ff68bb6a126ece5b8b')

build() {
	cmake \
		-B build \
		-S "Gtkeddit-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DDIST_BUILD=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
