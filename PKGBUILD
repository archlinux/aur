# Maintainer: Kirill Malyshev <keryascorpio at gmail.com>
pkgname=deadbeef-plugin-vk
pkgver=0.2.2
pkgrel=1
pkgdesc="DeadBeef VKontakte plugin"
url="https://github.com/scorpp/db-vk"
arch=('i686' 'x86_64')
license=('BSD')
source=("https://github.com/scorpp/db-vk/archive/v${pkgver}.tar.gz")
depends=('deadbeef' 'gtk3' 'curl' 'json-glib')
makedepends=('cmake')
md5sums=('4ecdae87aa821d2535933312f451531f')

build() {
	cmake "${srcdir}/db-vk-${pkgver}" \
	    -DWITH_GTK2=OFF \
	    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"

	make clean && make
}

package() {
	cd "${srcdir}" && make install
}

# vim:set ts=2 sw=2 et:
