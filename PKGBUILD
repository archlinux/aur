# Maintainer: David Schury <dasc at posteo de>

pkgname=libite
pkgver=1.8.3
pkgrel=1
pkgdesc='Extends the GNU libc with some missing stuff from BSD'
url='https://github.com/troglobit/libite'
arch=('any')
license=('custom')
source=("https://github.com/troglobit/${pkgname}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.xz")
sha256sums=('4e9365c3091ef564a9e8c362eb7d012c29da2607f48cd318a07f891789ee3b3d')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install-strip
}
