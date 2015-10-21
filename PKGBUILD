# Maintainer: TingPing <tingping@tingping.se>

pkgname=retro-gtk
pkgver=0.4
pkgrel=1
pkgdesc='Toolkit to write Gtk+ 3 based libretro frontends'
arch=('i686' 'x86_64')
license=('GPL3')
url='https://github.com/Kekun/retro-gtk'
depends=('gtk3' 'retro-gobject' 'libpulse' 'clutter-gtk' 'jsk')
makedepends=('intltool' 'libtool' 'gobject-introspection')
source=("https://github.com/Kekun/retro-gtk/releases/download/${pkgver}/retro-gtk-${pkgver}.tar.gz")
sha256sums=('c1b2093129fe7067676dc50e16b1ad57f22627e64f4bbd245d0d5803e3183138')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --enable-introspection
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir" make install
}
