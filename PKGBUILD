# Maintainer: TingPing <tingping@tingping.se>

pkgname=retro-gtk
pkgver=0.4
pkgrel=2
pkgdesc='Toolkit to write Gtk+ 3 based libretro frontends'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/retro-gtk'
depends=('gtk3' 'retro-gobject' 'libpulse' 'clutter-gtk')
makedepends=('intltool' 'libtool' 'gobject-introspection')
source=("https://github.com/Kekun/retro-gtk/releases/download/${pkgver}/retro-gtk-${pkgver}-fixed.tar.gz")
sha256sums=('9b3d25490972278ed95cbd9913aaaea6450747aab42c0c89720748f34c9a4b7f')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
