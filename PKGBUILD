# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.2.4
pkgrel=1
pkgdesc='C++17 library to make sharing a resource with multiple threads easier.'
url="https://gitlab.com/patlefort/${pkgname}"
license=('GPL3')
depends=()
makedepends=('cmake')
arch=('any')
optdepends=('boost: provide upgradeable locks')
sha256sums=('022024ac5d37676db4f28a9b60fa8d9e5e67822638f871893ff0fbf46e5db1aa')
source=("https://gitlab.com/patlefort/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")

build() {
	cmake -S "${pkgname}-v${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 "${pkgname}-v${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
