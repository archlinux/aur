# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-launch'
pkgver='0.1.0'
pkgrel=1
pkgdesc='A simple Nautilus extension that allows to run executables and launchers via right-click menu'
arch=('i686' 'x86_64')
url='https://github.com/madmurphy/nautilus-launch'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
makedepends=('pkgconf' 'intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('73a5b55956335d4d1eff0e8ef0ea46d473fc23f579b05f402a666478bcc985c9')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	make DESTDIR="${pkgdir}" install

}

