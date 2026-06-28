# Maintainer: Ivan Janković <ivan.jankovic.unix@gmail.com>

pkgname=tmuzika
pkgver=1.1.3
pkgrel=1
pkgdesc="Terminal music player with ncurses UI and GStreamer backend"
arch=('x86_64')
url="https://github.com/ivanjeka/tmuzika.git"
license=('GPL-3.0-or-later')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'glib2' 'ncurses')
makedepends=('git' 'pkgconf' 'gettext')
provides=('tmuzika')
conflicts=('tmuzika')
source=("tmuzika-$pkgver.tar.gz::https://github.com/ivanjeka/tmuzika/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# binarni fajl
	make DESTDIR="$pkgdir" install
}