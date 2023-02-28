# Maintainer: lantw44 (at) gmail (dot) com

pkgname=disarchive
pkgver=0.5.0
pkgrel=1
pkgdesc='Disassembler of software archives for long-term preservation'
arch=('x86_64' 'i686' 'armv7h')
url='https://ngyro.com/software/disarchive.html'
license=('GPL3')
depends=('guile' 'guile-gcrypt' 'guile-lzma' 'gzip' 'tar' 'xz' 'zlib')
checkdepends=('guile-quickcheck')
source=("https://files.ngyro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('020b7bbf91d3a5ab245ee62631d183448a256aa087529c1dfc27db6427bd529b')

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
