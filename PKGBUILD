# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='nautilus-bluetooth'
pkgver='0.1.0'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('any')
url="https://github.com/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
makedepends=('pkgconf' 'intltool')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/madmurphy/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9696cf889be83cc1a53617b5ccb8dd0027bef347524d7a458e5c8f9d5f495518')

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

