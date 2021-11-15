# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.4.1
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
url='https://gitlab.com/postmarketOS/megapixels'
license=(LGPL)
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
sha256sums=('5b501f8b7971a56b59889b10c3ab613781c92173655a2fdfc656a96c032fd341')

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
