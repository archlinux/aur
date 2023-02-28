# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-quickcheck
pkgver=0.1.0
pkgrel=1
pkgdesc='Randomized property-based testing for Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://ngyro.com/software/guile-quickcheck.html'
license=('GPL3')
depends=('guile')
source=("https://files.ngyro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('cb99ac5be99b43b61eb9c452d953543e890e2a83fc83acac289d94316888bc0e')

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
