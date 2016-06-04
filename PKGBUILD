# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio-git
_gitname=gradio
pkgver=2.3
pkgrel=1
pkgdesc='A Reddit Client For GNOME (with Gtk+ and Python)'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'json-glib' 'libgee' 'libsoup')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools' 'cmake')

options=('!emptydirs')
install=gradio.install
source=("git://github.com/haecker-felix/${_gitname}.git")
md5sums=('SKIP')
conflicts=('')
provides=("gradio=$pkgver")

build() {
	cd "$srcdir/${_gitname}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}