# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-bytestructures
_pkgname=bytestructures
pkgver=1.0.6
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/TaylanUB/scheme-bytestructures"
license=('GPL3')
depends=('guile')
makedepends=('git')
source=("https://github.com/TaylanUB/scheme-${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d35edf088a450a8ac6f9465c5421f8f77fb826c5b95dc06b4ddc32c36a76ae1d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
