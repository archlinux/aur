# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=haste-applet
pkgver=0.2.3
pkgrel=0.1
pkgdesc="A Budgie applet for the haste service."
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/cybre/${pkgname}"
md5sums=('617e91737dad6ecd667098d76ad262ec')
depends=('libpeas' 'budgie-desktop' 'libsoup')
makedepends=('unzip' 'gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools')
source=(https://github.com/cybre/${pkgname}/archive/${pkgver}.zip)

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
