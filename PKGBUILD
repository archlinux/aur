# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=yamc-git
provides=("yamc")
conflicts=("yamc")
pkgver=0.0.1.r2
pkgrel=1
pkgdesc="C++ mutex (mutual exclusion primitive for multi-threading) collections. This is header-only, cross-platform, no external dependency C++11 library."
url="https://github.com/yohhoy/yamc"
license=("MIT")
depends=()
builddepends=("cmake")
arch=("any")
optdepends=()
sha256sums=("SKIP")
_repo="yamc"
source=("git+https://github.com/yohhoy/${_repo}")

build() {
	cmake -S ${_repo} -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_TESTING=OFF
	make -C build
}

package() {
	make DESTDIR="${pkgdir}" -C build install
}
