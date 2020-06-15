# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-network-displays
pkgver=0.90.3
pkgrel=1
pkgdesc="Miracast implementation for GNOME"
arch=('any')
url="https://gitlab.gnome.org/GNOME/gnome-network-displays"
license=('GPL3')
depends=('gtk3' 'faac' 'gst-plugins-ugly' 'gst-rtsp-server' 'libpulse' 'libnm'
         'python-gobject' 'x264' 'xdg-desktop-portal')
makedepends=('meson' 'appstream-glib')
replaces=('gnome-screencast')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6296e7bd25a750cac24cf86d97819e3855a133e44553aacdb3d9f7b9b7ab56a6')

build() {
	cd "$pkgname-$pkgver"
	arch-meson . build
	ninja -C build
}

package() {
 	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
}
