# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-lzlib
pkgver=0.0.2
pkgrel=1
pkgdesc='Guile bindings for lzlib'
arch=('x86_64' 'i686' 'armv7h')
url='https://notabug.org/guile-lzlib/guile-lzlib'
license=('GPL3')
depends=('guile' 'lzlib')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('8623db77d447e7b9ffbfcbc288390e706a6b1a89b1171daed60874cfec7e4f87')

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
