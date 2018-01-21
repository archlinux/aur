# Maintainer: David Schury <dasc at posteo de>

pkgname=libite
pkgver=2.0.1
pkgrel=1
pkgdesc='Extends the GNU libc with some missing stuff from BSD'
url='https://github.com/troglobit/libite'
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
source=("https://github.com/troglobit/${pkgname}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.xz")

sha256sums=('11053a0fdd75233b33a7d1a13088c9fdec9d72f844bfeed48f49d839e769f88a')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install-strip
}
