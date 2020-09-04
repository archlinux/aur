# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess
pkgver=1.2.3
pkgrel=2
pkgdesc="C++17 library to make sharing a resource with multiple threads easier."
url="https://gitlab.com/patlefort/sharedaccess"
license=("GPL3")
depends=()
makedepends=("cmake")
arch=("any")
optdepends=("boost: provide upgradeable locks")
sha256sums=("bc9efb51b712d989c06021f45e01468dbf5ba2b449af2a634353142425868295")
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
