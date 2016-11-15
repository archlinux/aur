# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gradio
_gitname=gradio
pkgver=5.0.0.beta2
_pkgver=5.0.0-beta2
pkgrel=2
pkgdesc='A GTK3 app for finding and listening to internet radio stations'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/haecker-felix/gradio"
depends=('desktop-file-utils' 'gstreamer' 'gst-plugins-ugly'  
'json-glib' 'libgee' 
'libsoup')
makedepends=('unzip' 'gnome-common' 'intltool' 'itstool' 'vala' 'yelp-tools' 'cmake')
options=('!emptydirs')
install=gradio.install
source=("https://github.com/haecker-felix/${_gitname}/archive/v${_pkgver}.zip")
md5sums=('b3da8e5c5abdcb44cfefd505757a30fe')
conflicts=('gradio-git' 'gradio-bin')
provides=("gradio=$_pkgver")

build() {
	cd "$srcdir/gradio-${_pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/gradio-${_pkgver}"
	make DESTDIR="${pkgdir}" install
}
