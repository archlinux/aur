# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.2.9
pkgrel=1
pkgdesc='C++17 library to make sharing a resource with multiple threads easier.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL-3.0-only')
depends=('boost')
makedepends=('cmake')
arch=('any')
sha256sums=('870fc22fcd818a9c9f43e8c729caa02ad4d502b5e79ee02a0262ed36c1f9b340')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")

_srcdir="${pkgname}-v${pkgver}"

build() {
	cmake -S "${_srcdir}" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
