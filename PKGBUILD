# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-zlib
pkgver=0.0.1
pkgrel=1
pkgdesc='Guile bindings for zlib'
arch=('x86_64' 'i686' 'armv7h')
url='https://notabug.org/guile-zlib/guile-zlib'
license=('GPL3')
depends=('guile' 'zlib')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f1100be6dd31b02983cf498155bf11155ca833421f99698f29e5694317335fb1')

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
