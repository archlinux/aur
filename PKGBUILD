# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-semver
pkgver=0.1.1
pkgrel=1
pkgdesc='Guile library for Semantic Versioning'
arch=('x86_64' 'i686' 'armv7h')
url='https://ngyro.com/software/guile-semver.html'
license=('GPL3')
depends=('guile')
source=("https://files.ngyro.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4f790919375feb204a8ea2eda92a291d9bb4de4c8eb1c6776784589a86253781')

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
