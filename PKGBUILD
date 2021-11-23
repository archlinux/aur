# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=megapixels
pkgver=1.4.2
pkgrel=1
pkgdesc='GTK4 camera application that knows how to deal with the media request api'
url='https://gitlab.com/postmarketOS/megapixels'
license=(LGPL)
arch=(x86_64 aarch64)
depends=(gtk4 zbar)
makedepends=(meson)
source=("${url}/-/archive/${pkgver}/megapixels-${pkgver}.tar.gz")
sha256sums=('cffa2ad504d3e1d693495da9854241af8db32f393f217c3fb67e4294f5e7c00a')

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
