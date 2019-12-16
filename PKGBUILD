# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-network-displays
pkgver=0.90.2
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://github.com/benzea/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm'
         'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('meson' 'appstream-glib')
replaces=('gnome-screencast')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('232af8e63d0108c1eee2112afc25c074da26a7e27e3f25dd4a70ea8f4c6fb112')

build() {
	cd "$pkgname-$pkgver"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
