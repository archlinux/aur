# Contributor: lantw44 (at) gmail (dot) com

pkgname=guile-lzlib
pkgver=0.3.0
pkgrel=1
pkgdesc='Guile bindings for lzlib'
arch=('x86_64' 'i686' 'armv7h')
url='https://notabug.org/guile-lzlib/guile-lzlib'
license=('GPL3')
depends=('guile' 'lzlib')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a7f99c8d2a143e05ea22db2dc8b9ce6c27cae942162b45ee3015ed9027af0ff2')

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
