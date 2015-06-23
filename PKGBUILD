# Maintainer: John "ShaggyTwoDope" Jenkins <twodopeshaggy at gmail dot com>
pkgname=tir
pkgver=0.2.3
pkgrel=1
pkgdesc="Terminal Image Renderer"
arch=('i686' 'x86_64')
url=https://github.com/shaggytwodope/tir
license=(GPL3)
makedepends=('go')
provides=('tir')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shaggytwodope/${pkgname}/archive/${pkgver}.tar.gz")
sha1sums=('1fb47f513fa84cd4f290ad3b27aaa2bd464fd747')

build() {
	export GOPATH="${srcdir}/godir"
	mkdir -p "$GOPATH"
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D tir "${pkgdir}/usr/bin/tir"
}

