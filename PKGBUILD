# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guile-zlib
pkgver=0.2.2
pkgrel=1
pkgdesc='Guile bindings for zlib'
arch=('x86_64' 'i686' 'armv7h')
url='https://notabug.org/guile-zlib/guile-zlib'
license=('GPL3')
depends=('guile' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6f6cca4b32ca79f3f4627cdb7ea68569a3cc38be60468991e2b5c085783e38c1')

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}"
	LANG=C.UTF-8 make check
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
