# Maintainer: Edgar Fournival <contact at edgar-fournival dot fr>

pkgname=budgie-calendar-applet-git
pkgver=r11.92eb2db
pkgrel=2
pkgdesc='Calendar applet for Budgie Desktop'
arch=('i686' 'x86_64')
url='https://github.com/danielpinto8zz6/budgie-calendar-applet'
license=('GPL2')
depends=('gtk3' 'glib2' 'libpeas' 'gobject-introspection' 'budgie-desktop')
makedepends=('git' 'vala')
source=("$pkgname"::'git+https://github.com/danielpinto8zz6/budgie-calendar-applet.git')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
