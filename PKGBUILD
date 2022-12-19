# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='libgnuisance'
pkgver='0.1.0'
pkgrel=1
pkgdesc='GTK New User Interfaces'
arch=('i686' 'x86_64')
url='https://github.com/madmurphy/libgnuisance'
license=('GPL')
depends=('glib2' 'libadwaita' 'gtk4')
makedepends=('gtk-doc')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('5da249887a143fbda6c5e57d1d264530cdc2a9a64f8ebdd3ac431dc9db18eafb')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-gtk-doc
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

