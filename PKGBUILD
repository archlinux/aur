# Maintainer: David Schury <dasc at posteo de>

pkgname=libite
pkgver=2.6.0
pkgrel=1
pkgdesc='Extends the GNU libc with some missing stuff from BSD'
url='https://github.com/troglobit/libite'
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
source=("https://github.com/troglobit/${pkgname}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.xz")

sha256sums=('665a8a791f41dfe69f44640453e37fd29e72ab0e02ed269f1582f7550d19796d')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install-strip
}
