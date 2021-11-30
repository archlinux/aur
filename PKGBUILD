# Maintainer: David Schury <dasc at posteo de>

pkgname=libite
pkgver=2.5.0
pkgrel=1
pkgdesc='Extends the GNU libc with some missing stuff from BSD'
url='https://github.com/troglobit/libite'
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
source=("https://github.com/troglobit/${pkgname}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.xz")

sha256sums=('0d53306a47d1b9e8d75cf9683b55fb8f5e144c37cc57e6279b1b54a004ce308d')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install-strip
}
