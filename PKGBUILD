# Maintainer: Andrius Lukosevicius <niobium93@gmail.com>

pkgname=obs-vaapi
pkgver=0.1.0
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
	meson "$srcdir/$pkgname" build --prefix=/usr --buildtype=release
	ninja -C build
}
package() {
	DESTDIR="$pkgdir" ninja -C build install
}
