# Contributor: damir <damir@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=libhangul2
_pkgname=libhangul
pkgver=0.2.0
pkgrel=1
pkgdesc='Input method library for Korean'
url='https://github.com/libhangul/libhangul'
license=('LGPL')
arch=('x86_64')
provide=('libhangul')
source=("https://github.com/libhangul/libhangul/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a8e1e70a91d51932bedc9b9d9e3099aba18d1b696cdc2395430076bf433855d0dbe807bc901f4eee4bd7bfda1e0079f73d58c6564a03e5f7828a7fe41c357c0a')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
