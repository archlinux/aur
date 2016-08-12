# Maintainer: Sébastien LEBEAU <sebcbi1 at gmail dot com>
# Contributor: Patrick Griffis <tingpign@fedoraproject.org>

pkgname=transmission-remote-gtk
pkgver=1.3.1
pkgrel=1
pkgdesc='GTK remote control for the Transmission BitTorrent client'
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
arch=('i686' 'x86_64')
license=('GPL2')
source=("https://github.com/transmission-remote-gtk/transmission-remote-gtk/releases/download/$pkgver/transmission-remote-gtk-$pkgver.tar.xz")
sha256sums=('1b29c573b1e205e3e7c2433dc4a48f9574278d97e033845d19bbffa1d7f75345')
depends=('curl' 'libnotify' 'libproxy' 'geoip' 'desktop-file-utils' 'gtk3' 'json-glib')
# Optionally 'libmrss'
makedepends=('intltool')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --disable-desktop-database-update
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
}
