# Maintainer: David Schury <dasc at posteo de>

pkgname=libite
pkgver=1.8.1
pkgrel=1
pkgdesc='Extends the GNU libc with some missing stuff from BSD'
url='https://github.com/troglobit/libite'
arch=('any')
license=('custom')
source=("https://github.com/troglobit/${pkgname}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.xz")
sha256sums=('99fcdc8911a43b91949dd294d6de73a28b4e2eb3567479bf99a66638a64a2df0')


build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install-strip
}
