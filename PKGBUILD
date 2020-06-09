# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.1.0
pkgrel=2
pkgdesc="C++17 library to make sharing a resource with multiple threads easier."
url="https://gitlab.com/patlefort/sharedaccess"
license=("GPL3")
depends=()
builddepends=("cmake")
arch=("any")
optdepends=("boost: provide upgradeable locks")
sha256sums=("2533beb088e961f6eed43644258e2e8a322e5a314d797b4d49fced6395fbce61")
_repo="sharedaccess"
source=("https://gitlab.com/patlefort/${_repo}/-/archive/${pkgver}/${_repo}-${pkgver}.tar.gz")

build() {
	cmake -S "${_repo}-${pkgver}" -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
	install -Dm644 "${_repo}-${pkgver}/license.txt" "${pkgdir}/usr/share/licenses/sharedaccess/LICENSE"
}
