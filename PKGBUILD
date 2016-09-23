# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Omar Pakker <omar.pakker@oracle.com>

pkgname=retro-gtk
pkgver=0.8.1
pkgrel=1
pkgdesc='Toolkit to write Gtk+ 3 based libretro frontends'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://git.gnome.org/browse/retro-gtk/'
depends=('gtk3' 'libpulse')
makedepends=('gobject-introspection' 'gtk3' 'intltool' 'libtool' 'libpulse' 'vala')
source=("https://git.gnome.org/browse/retro-gtk/snapshot/retro-gtk-${pkgver}.tar.xz")
sha256sums=('ed9976bb2eff191be0d0d1f4450bdf51cbe1c9b6156b95088acdf383b61c8087')

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
