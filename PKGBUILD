# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=screenshot-applet
pkgver=0.2
pkgrel=0.1
pkgdesc="A Budgie applet for taking and uploading screenshots to Imgur and Imagebin."
arch=('i686' 'x86_64')
license=('GPL3')
md5sums=('d08b04afdf616168d528589b60d72b49')
depends=('libpeas' 'budgie-desktop' 'json-glib' 'rest')
makedepends=('unzip' 'gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools')
source=(https://github.com/cybre/screenshot-applet/archive/${pkgver}.zip)

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
