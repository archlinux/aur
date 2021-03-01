# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-zstd
pkgver=0.1.1
pkgrel=1
pkgdesc='GNU Guile bindings to the zstd compression library'
arch=('x86_64' 'i686' 'armv7h')
url='https://notabug.org/guile-zstd/guile-zstd'
license=('GPL3')
depends=('guile' 'zstd')
source=("${pkgname}-${pkgver}.tar.gz::https://notabug.org/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6e57ef524f20cab79ca5fd62366c5435f71cf652f582fc1e7d62585e90d499c5')

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
