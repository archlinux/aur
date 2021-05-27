# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-hide'
pkgver='0.2.4'
pkgrel=1
pkgdesc='A simple Nautilus extension that adds "Hide" and "Unhide" to Nautilus right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-hide'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('a2315b31188f210a60e088ace9f5a2893785c3ef94b3c6a033a55d31fc384617')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

