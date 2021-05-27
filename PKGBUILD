# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-launch'
pkgver='1.0.4'
pkgrel=1
pkgdesc='A simple Nautilus extension that allows to run executables and launchers via right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-launch'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('8c9f1959bf30fba1e235e7c2b3862bf9d6b16e4382832c5b127cfa9e3e4dc6e0')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

