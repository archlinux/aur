# Maintainer: tytan652 <tytan652@tytanium.xyz>
# Contributor: Jack O'Sullivan <jackos1998 at gmail dot com>

pkgname=obs-gstreamer
pkgver=0.3.4
pkgrel=2
pkgdesc="An OBS Studio source plugin to feed GStreamer launch pipelines into OBS Studio."
arch=('i686' 'x86_64' 'aarch64')
url="https://obsproject.com/forum/resources/obs-gstreamer.696/"
license=('GPL2')
depends=('obs-studio' 'gst-plugins-base-libs')
makedepends=('git' 'meson')
optdepends=("gstreamer-vaapi: GStreamer VAAPI encoder")
options=('debug')
source=("git+https://github.com/fzwoch/obs-gstreamer#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	meson "$srcdir/$pkgname" build --prefix=/usr --buildtype=debugoptimized
	ninja -C build
}
package() {
	DESTDIR="$pkgdir" ninja -C build install
}
