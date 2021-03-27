# Maintainer: David Schury <dasc at posteo de>

pkgname=libite
pkgver=2.4.0
pkgrel=1
pkgdesc='Extends the GNU libc with some missing stuff from BSD'
url='https://github.com/troglobit/libite'
arch=('i686' 'x86_64' 'armv7h')
license=('custom')
source=("https://github.com/troglobit/${pkgname}/releases/download/v${pkgver}/${pkgname}-$pkgver.tar.xz")

sha256sums=('70e523fa4fbe35b936861cc3d9acfc5e9d2d2b3c7c48045ad0ab3551a5d728ef')

build() {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install-strip
}
