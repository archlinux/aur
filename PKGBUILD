# Maintainer: danielpinto8zz6 <danielpinto8zz6@gmail.com>

pkgname=budgie-calendar-applet
pkgver=1.0
pkgrel=1
pkgdesc="Calendar applet for Budgie Desktop"
arch=('i686' 'x86_64')
license=('GPL2')
sha256sums=('16d8b92b1bb7fdd3958afeff6481aa09f85f3ad26bf01f8c0975142e265c0284')
depends=('gtk3' 'glib2' 'libpeas' 'budgie-desktop' 'gnome-calendar')
makedepends=('git' 'vala')
source=(https://github.com/danielpinto8zz6/${pkgname}/archive/${pkgver}.zip)
url="https://github.com/danielpinto8zz6/${pkgname}"

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
