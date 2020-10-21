# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-bluetooth'
pkgver='0.1.6'
pkgrel=1
pkgdesc="A simple Nautilus extension that adds a \"Send via Bluetooth\" entry to Nautilus' right-click menu"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/madmurphy/nautilus-bluetooth"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'gnome-bluetooth')
makedepends=('intltool')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://gitlab.gnome.org/madmurphy/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b725260947c2e5aab6f71b9a27e8fff6527f21eba9fe6d4592104150da14ce39')

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

