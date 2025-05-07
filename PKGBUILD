# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.2.8
pkgrel=1
pkgdesc='C++17 library to make sharing a resource with multiple threads easier.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL-3.0-only')
depends=('boost')
makedepends=('cmake')
arch=('any')
sha256sums=('001af567b1bfc176d77082cee2d36babd1df8fe4471f2602c87bd4c5bf8556b9')
source=("https://gitlab.com/patlefort/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")

build() {
	cmake -S "${pkgname}-v${pkgver}" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
