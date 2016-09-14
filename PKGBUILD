# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=screenshot-applet
pkgver=0.3.8
pkgrel=0.1
pkgdesc="A Budgie applet for taking and uploading screenshots to Imgur and Imagebin."
arch=('i686' 'x86_64')
license=('GPL2')
md5sums=('2c8f4eac2c2fefce834cd0458423db24')
depends=('libpeas' 'budgie-desktop'  'json-glib' 'rest' 'gnome-screenshot')
makedepends=('unzip' 'gnome-common' 'gobject-introspection' 'intltool' 'itstool' 'vala' 'yelp-tools')
source=(https://github.com/cybre/screenshot-applet/archive/${pkgver}.zip)
url="https://github.com/cybre/${pkgname}"

build() {
	cd "$srcdir/budgie-${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/budgie-${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
