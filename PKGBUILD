# Maintainer:  Jan Kohnert <bughunter@jan-kohnert.de>

pkgname=astromatic-missfits
_pkgname=missfits
pkgver=2.8.0
pkgrel=1
pkgdesc="manipulates astronomical fits files"
url="http://www.astromatic.net/software/missfits"
arch=('x86_64')
license=('GPL')
makedepends=()
provides=()
backup=()
source=(https://www.astromatic.net/download/missfits/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('65772902ec29c33768bd579aefa577acbd93b671423e5edb2621ffaddd695912')


build() {

	cd $srcdir/${_pkgname}-${pkgver}
	./configure --prefix=/usr $_COPTS
	make
}

package() {

	cd $srcdir/${_pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}

