# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Conributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: lantw44 (at) gmail (dot) com

_pkgname=bytestructures
pkgname=guile-$_pkgname
pkgver=2.0.2
pkgrel=1
pkgdesc='Structured access to bytevector contents.'
arch=('x86_64')
url="https://github.com/TaylanUB/scheme-$_pkgname"
license=('GPL-3.0-or-later')
depends=('guile')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TaylanUB/scheme-${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0681daa006c80efd2fce5dc174ac439d44be8a9c2e70938e497efad08cd5659')

prepare() {
	cd "${srcdir}/scheme-${_pkgname}-${pkgver}"
	aclocal
	autoconf
	automake --add-missing
}
build() {
	cd "${srcdir}/scheme-${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}
check() {
	cd "${srcdir}/scheme-${_pkgname}-${pkgver}"
	make check
}
package() {
	cd "${srcdir}/scheme-${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
