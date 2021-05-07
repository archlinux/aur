# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-hide'
pkgver='0.2.2'
pkgrel=1
pkgdesc='A simple Nautilus extension that adds "Hide" and "Unhide" to Nautilus right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-hide'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
makedepends=('intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('6e074e408e71ab199ae1f1cd40b0fbd37993f54a34bf08a87fd015cec1257474')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	make DESTDIR="${pkgdir}" install

}


