# Maintainer: Michał Lisowski <lisu@riseup.net>
# Contributor: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=revelation
pkgver=0.5.3
pkgrel=1
pkgdesc="A password manager for the GNOME desktop"
arch=('x86_64')
license=('GPL')
depends=('gtk3' 'python-gobject' 'libpwquality' 'python-pycryptodomex' 'pkg-config')
url="http://revelation.olasagasti.info/"
source=("https://github.com/mikelolasagasti/revelation/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8976644b8904db179f5927ea9045c5082faefdfecf079845ca081321935bdfac')

build() {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
	./configure \
		--prefix=/usr \
		--disable-desktop-update \
		--disable-mime-update
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

