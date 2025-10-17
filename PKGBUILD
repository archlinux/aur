# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=wxedid
pkgver=0.0.33
pkgrel=1
pkgdesc='wxWidgets-based EDID (Extended Display Identification Data) editor'
arch=('x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('wxwidgets-gtk3')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e09fcf9cc4c538c9ed7d8b92568cd16fbfaa84f58b9b8bf95de7d6e215606d4de5e5f7ecbf041cf676591cb93e1c36479ec88615684e4e4f4700af41c01074c9')

build() {
	cd "${pkgname}-${pkgver}"
	autoreconf -f -i
	./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install
}
