# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sharedaccess-git
pkgver=1.0.0
pkgrel=1
pkgdesc="C++17 library to make sharing a resource with multiple threads easier."
url="https://gitlab.com/patlefort/sharedaccess"
license=("GPL3")
depends=()
builddepends=("cmake")
arch=("any")
optdepends=("boost: provide upgradeable locks")
sha256sums=("SKIP")
source=("git+https://gitlab.com/patlefort/sharedaccess")
_repo="sharedaccess"

build() {
	cmake -S sharedaccess -B build -DCMAKE_BUILD_TYPE=Release
	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
}
