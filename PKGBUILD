# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-launch'
pkgver='0.1.2'
pkgrel=1
pkgdesc='A simple Nautilus extension that allows to run executables and launchers via right-click menu'
arch=('i686' 'x86_64')
url='https://github.com/madmurphy/nautilus-launch'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
makedepends=('intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
sha256sums=('c42ddd99682498a69500de81e8f94542ad741f31eb1e0dd127fe5bb1538f9c97')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	./configure --prefix=/usr
	make

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}-with-configure"
	make DESTDIR="${pkgdir}" install

}

