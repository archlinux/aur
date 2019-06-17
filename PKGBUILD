# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-network-displays
pkgver=0.90.0
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://github.com/benzea/gnome-network-displays"
license=('GPL3')
depends=('appstream-glib' 'desktop-file-utils' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'networkmanager' 'python-gobject' 'x264')
makedepends=('meson')
conflicts=('gnome-screencast')
source=("https://github.com/benzea/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	meson . build --prefix /usr
	ninja -C build
}

package() {
 	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
