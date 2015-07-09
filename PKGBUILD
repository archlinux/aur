# Maintainer: TingPing <tingping@tingping.se>

pkgname=libsexy3
pkgver=1.1.0
pkgrel=1
pkgdesc='Custom Gtk3 widgets'
arch=('i686' 'x86_64')
license=('GPL')
url='https://tingping.github.io/libsexy3'
depends=('gtk3' 'enchant')
makedepends=('iso-codes' 'intltool' 'gtk-doc' 'gobject-introspection' 'vala')
source=("https://github.com/TingPing/libsexy3/releases/download/v1.1.0/libsexy3-${pkgver}.tar.xz")
sha256sums=('3cd2f377b9cdc55ebb238008b38cff37b7a0bef42ad400eb836c65fd1a40d625')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --enable-gtk-doc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
}
