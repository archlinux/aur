# Maintainer: TingPing <tingping@tingping.se>

pkgname=libgrss
pkgver=0.7.0
pkgrel=1
pkgdesc='A Glib-based library to manage RSS and Atom feeds'
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Projects/Libgrss"
license=('LGPL3')
depends=('glib2' 'libsoup' 'libxml2')
makedepends=('gtk-doc' 'gobject-introspection')
source=("https://download.gnome.org/sources/libgrss/${pkgver:0:3}/$pkgname-$pkgver.tar.xz")
sha256sums=('6709c0f630a915ea7d5f1ac88ac173ef974d8d7406f43bd4be70d3e71fd554d9')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-gtk-doc --enable-introspection
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
