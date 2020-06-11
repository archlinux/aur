# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.1.0
pkgrel=3
pkgdesc="C++17 library to make sharing a resource with multiple threads easier."
url="https://gitlab.com/patlefort/sharedaccess"
license=("GPL3")
depends=()
builddepends=("cmake")
arch=("any")
optdepends=("boost: provide upgradeable locks")
sha256sums=("058d95b63cf9a6261e4eb9ef9a169d1aa9c1517cdab88710245545c747e81496")
_repo="sharedaccess"
source=("https://gitlab.com/patlefort/${_repo}/-/archive/v${pkgver}/${_repo}-v${pkgver}.tar.gz")

build() {
	cmake -S "${_repo}-v${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
	install -Dm644 "${_repo}-v${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
