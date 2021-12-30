# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason Wood <jwood@startmail.com>

pkgname=headlines
pkgver=0.5.2
pkgrel=1
pkgdesc="GTK4 Reddit client"
arch=('x86_64')
url="https://gitlab.com/caveman250/headlines"
license=('GPL3')
depends=(
	'gtkmm-4.0'
	'libmicrohttpd'
	'curl'
	'jsoncpp'
	'libxml2'
	'ffmpeg'
	'gstreamer'
	'gst-plugins-base'
	'gst-plugins-good'
	'gst-plugins-bad'
	'gst-libav'
	'youtube-dl'
	'websocketpp'
	'libadwaita'
	'xdg-utils'
	'libsecret')
makedepends=('cmake' 'boost')
replaces=('gtkeddit')
source=("$pkgname-$pkgver.tar.bz2::$url/-/archive/$pkgver/Headlines-$pkgver.tar.bz2")
sha256sums=('791f4ea1a145201d5a15e8e6116a89d3ea2df83ac28a0b7a66d17a91e323a34c')

build() {
	cmake \
		-B build \
		-S "Headlines-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DDIST_BUILD=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
}
