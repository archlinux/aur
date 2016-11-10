# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio-git
_gitname=gradio
pkgver=5.0.0.beta2
pkgrel=1
pkgdesc='A GTK3 app for finding and listening to internet radio stations'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'gst-plugins-ugly' 'json-glib' 
'libgee' 
'libsoup')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools' 'cmake')

options=('!emptydirs')
install=gradio.install
source=("git://github.com/haecker-felix/${_gitname}.git")
md5sums=('SKIP')
conflicts=('gradio' 'gradio-bin')
provides=("gradio=$pkgver")

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}
