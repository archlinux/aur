# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-bytestructures
_pkgname=bytestructures
pkgver=1.0.3
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile'
arch=('x86_64' 'i686')
url="https://github.com/TaylanUB/scheme-bytestructures"
license=('GPL3')
depends=('guile')
makedepends=('git')
source=("https://github.com/TaylanUB/scheme-${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('28e4a0b36d745b34f5531af6efb9fa0a992c4c3cde64252692a698d11ed2c675')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	rm -r "${pkgdir}/usr/share/guile/site/2.2/bytestructures/body"
	rm -r "${pkgdir}/usr/share/guile/site/2.2/bytestructures/r7"
	rm "${pkgdir}/usr/share/guile/site/2.2/"run-tests.*.scm
}
