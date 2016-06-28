# Maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=something-for-reddit
pkgver=0.2
pkgrel=1
pkgdesc='A Reddit Client For GNOME (with Gtk+ and Python)'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/samdroid-apps/something-for-reddit"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-gobject' 'python-arrow' 'python-markdown' 'ruby-sass' 'markdown-urlize-git' 'libsoup' 'webkitgtk2')
makedepends=('gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools')
conflicts=('something-for-reddit-git')
source=("https://github.com/samdroid-apps/something-for-reddit/archive/v${pkgver}.tar.gz")
sha256sums=('b7dcdbfcef699993ad70207ba11938b52d088a39e27ac1a8198f074df30f2e1d')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
