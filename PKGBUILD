# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.5.1
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
arch=(x86_64 aarch64)
url='https://gitlab.com/postmarketOS/megapixels'
license=(LGPL)
depends=(gtk4 zbar)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
b2sums=('8dae8dc8763cb5ca1325a6949daffb8be55514629b012cbaff1bbb857ad98a9900abb99045f91575dd9f95d5df2ee8312a931dbe00cd4b732336a5567b15a32d')

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
