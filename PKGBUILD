# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Conributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: lantw44 (at) gmail (dot) com

pkgname=guile-bytestructures
_pkgname=bytestructures
pkgver=2.0.1
pkgrel=2
pkgdesc='Structured access library to bytevector contents for Guile'
arch=('x86_64')
url="https://github.com/TaylanUB/scheme-bytestructures"
license=('GPL3')
depends=('guile')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TaylanUB/scheme-${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fd5787a4bfa463a1efb736adf969b291abc0333c1d477e0de61c58e528c33950')

build() {
	cd "${srcdir}/scheme-${_pkgname}-${pkgver}"
	aclocal
	autoconf
	automake --add-missing
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/scheme-${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
