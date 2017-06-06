# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-calendar-applet
pkgver=2.0
pkgrel=1
pkgdesc="Calendar applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('da25249f3675a04d999e62e7c5f9f58fd1131877a152436ef84f1ae10f6d9fa2')
depends=('gtk3' 'glib2' 'libpeas' 'budgie-desktop' 'gobject-introspection')
makedepends=('git' 'vala')
source=(https://github.com/danielpinto8zz6/${pkgname}/archive/${pkgver}.tar.gz)
url="https://github.com/danielpinto8zz6/${pkgname}"

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
