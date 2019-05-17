# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-bytestructures
_pkgname=bytestructures
pkgver=1.0.5
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile'
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/TaylanUB/scheme-bytestructures"
license=('GPL3')
depends=('guile')
makedepends=('git')
source=("https://github.com/TaylanUB/scheme-${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8344abded5016e6d15f9aa10b3fcbac3d2a70be98ba89d2d0585accba53b7345')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
