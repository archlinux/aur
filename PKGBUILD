# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.2.1
pkgrel=1
pkgdesc="C++17 library to make sharing a resource with multiple threads easier."
url="https://gitlab.com/patlefort/sharedaccess"
license=("GPL3")
depends=()
builddepends=("cmake")
arch=("any")
optdepends=("boost: provide upgradeable locks")
sha256sums=("a7875a71f579cb9d5dcc43e5301bfe29c64f7a058df85fdb577b7204811b1690")
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
