# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-network-displays
pkgver=0.90.1
pkgrel=4
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://github.com/benzea/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm' 'python-gobject'
         'x264' 'xdg-desktop-portal')
makedepends=('meson' 'appstream-glib')
replaces=('gnome-screencast')
source=("$pkgname-$pkgver.tar.gz::https://github.com/benzea/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d0fe4d6bf76761f1ea5eb9598fb168ba6e0da3616fa7027b9cd2b86cdab97459')

build() {
	cd "$pkgname-$pkgver"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
