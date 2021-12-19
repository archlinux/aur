# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.4.3
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
url='https://gitlab.com/postmarketOS/megapixels'
license=(LGPL)
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
sha256sums=('8976fa727fa5650499fe1ae923a93d56fedd62e02d92def24d4bf4b0d25a902f')

build() {
	arch-meson ${pkgname}-${pkgver} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
