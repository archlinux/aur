# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-hide'
pkgver='0.1.0'
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
sha256sums=('5accaef09428f86cc8f862330b830f664d890690386e677d91ce0600dd0a464a')

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

