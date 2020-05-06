# Maintainer: undevdecatos
# Old maintainer: Jameson Pugh <imntreal@gmail.com>
# Contributor: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=something-for-reddit
pkgver=0.2.2
pkgrel=1
pkgdesc='A Reddit Client For GNOME (with Gtk+ and Python)'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/samdroid-apps/something-for-reddit"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-gobject' 'python-arrow' 'python-markdown' 'ruby-sass' 'markdown-urlize-git' 'libsoup' 'webkit2gtk')
makedepends=('gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools' 'sassc')
conflicts=('something-for-reddit-git')
source=("https://github.com/samdroid-apps/something-for-reddit/archive/v${pkgver}.tar.gz")
sha256sums=('55b17db5a7b4b665fd31fc7ab1b730c9c2c062899b227c7aeb4e87a0a58b18ae')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
