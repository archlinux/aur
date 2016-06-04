# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=something-for-reddit-git
_gitname=something-for-reddit
pkgver=0.1
pkgrel=1
pkgdesc='A Reddit Client For GNOME (with Gtk+ and Python)'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/samdroid-apps/something-for-reddit"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-gobject' 'python-arrow' 'python-markdown' 'ruby-sass' 'markdown-urlize-git' 'libsoup' 'webkitgtk2')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools')

options=('!emptydirs')
install=something-for-reddit.install
source=("git://github.com/samdroid-apps/${_gitname}.git")
md5sums=('SKIP')
conflicts=('')
provides=("something-for-reddit=$pkgver")

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}