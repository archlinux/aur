# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio
_gitname=gradio
pkgver=4.0.1
pkgrel=1
pkgdesc='A GTK3 app for finding and listening to internet radio stations'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'json-glib' 'libgee' 'libsoup')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools' 'cmake')
options=('!emptydirs')
install=gradio.install
source=("https://github.com/haecker-felix/${_gitname}/archive/v${pkgver}.zip")
md5sums=('7c50e0dc0ec944d0a7893d8a7df1c41a')
conflicts=('gradio-git')
provides=("gradio=$pkgver")

build() {
	cd "$srcdir/gradio-${pkgver}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/gradio-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
