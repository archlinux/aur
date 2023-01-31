# Maintainer: Andrius Lukosevicius <niobium93@gmail.com>

pkgname=obs-vaapi
pkgver=0.2.0
pkgrel=2
pkgdesc="OBS Studio VAAPI support via GStreamer"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/fzwoch/obs-vaapi"
license=('GPL2')
depends=('obs-studio' 'gst-plugins-base-libs' 'gstreamer-vaapi' 'gst-plugin-va')
makedepends=('git' 'meson')
source=("git+https://github.com/fzwoch/obs-vaapi#tag=$pkgver")
sha256sums=('SKIP')

build() {
	meson setup "$srcdir/$pkgname" build --prefix=/usr/lib/obs-plugins --buildtype=release
	ninja -C build
}
package() {
	DESTDIR="$pkgdir" ninja -C build install
}
