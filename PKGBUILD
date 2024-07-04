# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Jason Kercher <jkercher43 at gmail>
pkgname=gtksourceview2
pkgver=2.10.5
pkgrel=5
pkgdesc="A text widget that extends the standard gtk+ 2.x"
arch=(x86_64)
url="https://download.gnome.org/sources/gtksourceview"
license=(LGPL-2.1-or-later)
depends=(harfbuzz glibc cairo bash python gtk2 at-spi2-core pango libxml2 glib2 fontconfig freetype2 gdk-pixbuf2)
makedepends=('intltool' 'glib2-devel')
checkdepends=()
provides=()
source=("$url/2.10/gtksourceview-$pkgver.tar.gz")
md5sums=(220db5518e3f7fa06c980f057b22ba62)

build() {
	cd "gtksourceview-$pkgver/"
	CFLAGS="$CFLAGS -Wno-error=incompatible-pointer-types"
	./configure --prefix=/usr
	make
}

package() {
	cd "gtksourceview-$pkgver"
	make DESTDIR="$pkgdir/" install
}
