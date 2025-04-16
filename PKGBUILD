# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=guile-bzip2
pkgver=0.1.0
pkgrel=1
pkgdesc='Guile wrapper for the libbzip2 (bzip2) library.'
arch=('x86_64' 'i686' 'armv7h')
url='https://ngyro.com/software/guile-bzip2.html'
license=('GPL3')
depends=('bzip2' 'guile' 'guile-bytestructures')
source=("https://files.ngyro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b02d9ecc02224df863ec5fa2972b08a8c13985885bc2c9c28ca9a2f75d99dde2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
