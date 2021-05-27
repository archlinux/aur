# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-bluetooth'
pkgver='1.0.3'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('df09960c85b6f2ddbb16ff875d3f6327435465976ce55fd28af2a45e74fd79d9')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}
