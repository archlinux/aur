# Contributor: lantw44 (at) gmail (dot) com

pkgname=disarchive
pkgver=0.6.0
pkgrel=1
pkgdesc='Disassemble software archives into data and metadata'
arch=('x86_64' 'i686' 'armv7h')
url='https://ngyro.com/software/disarchive.html'
license=('GPL3')
depends=('guile' 'guile-gcrypt' 'guile-lzma' 'guile-bzip2' 'gzip' 'tar' 'xz' 'zlib' 'bzip2')
checkdepends=('guile-quickcheck')
source=("https://files.ngyro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('13813a48cbe190cc21508b2313e38d77dbdd6658c2c310eceb4aff0021f494e8')

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
