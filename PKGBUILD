# Maintainer: Sébastien LEBEAU <sebcbi1 at gmail dot com>

pkgname=transmission-remote-gtk
pkgver=1.2
pkgrel=2
pkgdesc="GTK remote control for the Transmission BitTorrent client"
url="https://github.com/ajf8/transmission-remote-gtk"
arch=('i686' 'x86_64')
license=(GPL2)
commit=aa4e0c7d836cfcc10d8effd10225abb050343fc8
source=("https://github.com/ajf8/transmission-remote-gtk/archive/$commit.zip")
sha1sums=('0de823b0031cd0f98fc28f353a21cb89ec1ed163')
depends=('curl' 'libnotify' 'geoip' 'desktop-file-utils' 'gtk3' 'json-glib')
makedepends=('intltool' 'gtk-update-icon-cache')


build() {
	cd "$pkgname-$commit"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$commit"
	make DESTDIR="$pkgdir/" install
}
