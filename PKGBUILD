# Maintainer: Jesse McClure <code at jessemcclure dot org>
_fossil=laylua
pkgname=${_fossil}-fossil
pkgver=0.2.1.3bbe12f608
pkgrel=1
pkgdesc='Lua interface to create layer-shell windows'
arch=('x86_64')
license=('MIT')
depends=(cairo luajit pango wayland)
makedepends=(fossil)
url=https://code.jessemcclure.org/${_fossil}
source=(fossil+${url})
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_fossil}"
	fossil describe | tr - .
}

build() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr
}

package() {
	cd "${srcdir}/${_fossil}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

