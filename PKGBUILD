# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=wxedid
pkgver=0.0.32
pkgrel=1
pkgdesc='wxWidgets-based EDID (Extended Display Identification Data) editor'
arch=('x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('wxwidgets-gtk3')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('46aaf8a9fb578ea2ed725aa6a60a33f359dc76701226695d1f8e5c252d1fa834dc972fbf1f8788e4045699115bf3e7143bc70bc9d2b6a9731e69e0f51dfb6376')

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
