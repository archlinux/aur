# Maintainer: Jesse McClure <code at jessemcclure dot org>
_fossil=tabby
pkgname=${_fossil}-fossil
pkgver=3.0.1.ff51b00113
pkgrel=1
pkgdesc='Tabbed tiling wayland compositor'
arch=('x86_64')
license=('MIT')
depends=(glibc libinput libxkbcommon nkk-fossil wayland wlroots)
makedepends=(fossil wayland-protocols)
optdepends=('polkit: starting wlroots-based compositors without seatd')
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

