# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.2.5
pkgrel=1
pkgdesc='C++17 library to make sharing a resource with multiple threads easier.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL3')
depends=('boost')
makedepends=('cmake')
arch=('any')
sha256sums=('ddf70cdb5e6e5f9d84f17fd8206eeebf1e03a1d77c1b583a2b54cf47d141595b')
source=("https://gitlab.com/patlefort/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")

build() {
	cmake -S "${pkgname}-v${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "${pkgname}-v${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
