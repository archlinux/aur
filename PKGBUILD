# Maintainer: Tamás Barta < barta dot tamas dot d at gmail dot com >

pkgname="gnome-shell-extension-panel-osd"
pkgver=1.0
pkgrel=2
pkgdesc="Place gnome-shell notifications under the panel instead of above the message-tray."
arch=("any")
url="https://gitlab.com/jenslody/${pkgname}/"
license=("GPL" "GPL3")
depends=("gnome-shell")
makedepends=("gnome-common" "automake" "autoconf" "intltool" "pkg-config")
install="panel-osd.install"
source=("https://gitlab.com/jenslody/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=("29e48d8d02fac0a76ee3d5d85379e4cc")

build() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	make DESTDIR="${pkgdir}" install
}
