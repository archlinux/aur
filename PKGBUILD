# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-hide'
pkgver='0.2.0'
pkgrel=1
pkgdesc='A simple Nautilus extension that adds "Hide" and "Unhide" to Nautilus right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-hide'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
makedepends=('intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('2654b0e9942f2eaf285c76195806ccfae5ef847bcb699aa8c56baa956a67c54e')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./bootstrap --noconfigure

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

