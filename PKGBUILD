# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-zlib
pkgver=0.1.0
pkgrel=1
pkgdesc='Guile bindings for zlib'
arch=('x86_64' 'i686' 'armv7h')
url='https://notabug.org/guile-zlib/guile-zlib'
license=('GPL3')
depends=('guile' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('25c726b570a06d21bc6fd7ec6093f377c749ce2efdd1d1516ac1b595f3f94ee9')

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}"
	make check
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
