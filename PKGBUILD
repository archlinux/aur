# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: TingPing <tingping@tingping.se>

pkgname=retro-gtk
pkgver=0.6
pkgrel=1
pkgdesc='Toolkit to write Gtk+ 3 based libretro frontends'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/retro-gtk'
depends=('cairo' 'clutter-gtk' 'glib2' 'gtk3' 'libpulse' 'retro-gobject')
makedepends=('cairo' 'clutter-gtk' 'gobject-introspection' 'glib2' 'gtk3' 'intltool' 'libtool' 'libpulse' 'retro-gobject' 'vala')
source=("https://github.com/Kekun/retro-gtk/archive/${pkgver}.tar.gz")
sha256sums=('c6c75c2077016162293d590ba31eb72884e41f446f6d75d0c1052feabe0a15e6')

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
