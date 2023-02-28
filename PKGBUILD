# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-lzma
pkgver=0.1.1
pkgrel=1
pkgdesc='Guile bindings for liblzma'
arch=('x86_64' 'i686' 'armv7h')
url='https://ngyro.com/software/guile-lzma.html'
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'xz')
source=("https://files.ngyro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2b866896d672ed4d39008f4b5336750d7897560a06678365f5c5a72bd2fcce5e')

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
