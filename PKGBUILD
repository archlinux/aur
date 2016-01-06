# Maintainer: Tamás Barta < barta dot tamas dot d at gmail dot com >

pkgname="gnome-shell-extension-panel-osd"
pkgver=1.0
pkgrel=1
pkgdesc="Place gnome-shell notifications under the panel instead of above the message-tray."
arch=("any")
url="https://github.com/jenslody/${pkgname}/"
license=("GPL" "GPL3")
depends=("gnome-shell")
makedepends=("gnome-common" "automake" "autoconf" "intltool" "pkg-config")
install="panel-osd.install"
source=("https://github.com/jenslody/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=("6aa7c530e31d82cf82b9583933090136")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
