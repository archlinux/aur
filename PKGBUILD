# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guile-bytestructures
_pkgname=bytestructures
pkgver=1.0.10
pkgrel=1
pkgdesc='Structured access library to bytevector contents for Guile'
arch=('x86_64')
url="https://github.com/TaylanUB/scheme-bytestructures"
license=('GPL3')
depends=('guile')
makedepends=('git')
source=("https://github.com/TaylanUB/scheme-${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bb8a78c1e570f90e344368196844ee0f143682b3d4c6ab69d6de0fa0d7b7c20d')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
