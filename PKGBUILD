# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-bluetooth'
pkgver='0.1.2'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('any')
url="https://github.com/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
makedepends=('pkgconf' 'intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('914ccac1ec0f0d045e1ae22b1531d92220ec72c0483b4f638c22a9c4a6ec9f57')

prepare() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --noconfigure
	./configure --prefix=/usr

}

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make

}


check() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make check

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

}

