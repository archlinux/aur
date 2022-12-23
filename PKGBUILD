# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnuisance'
pkgver='0.2.0'
pkgrel=1
pkgdesc='GTK New User Interfaces'
arch=('i686' 'x86_64')
url="https://madmurphy.github.io/${pkgname}"
license=('GPL')
depends=('glib2' 'libadwaita' 'gtk4')
makedepends=('gtk-doc')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('1e9dcb044a2ed1ea03803012de50f36ee4aa867e07b624877377f2d629b9c155')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-gtk-doc
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

