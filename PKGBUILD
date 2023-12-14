# Maintainer: balaraz <balaraz@tuta.io>

pkgname=argumentum-headeronly
_pkgname=argumentum
pkgver=0.3.2
pkgrel=1
pkgdesc="C++ command line parsing library. Header only"
url="https://github.com/mmahnic/${_pkgname}"
license=(MPL2)
groups=(libraries)
arch=(any)
makedepends=(cmake make)
optdepends=(cmake)
provides=()
conflicts=(argumentum)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("3db84bfbd4d459b3128f449de9b88ae1e222cb62a4ba95dc4db6eb48a2af9f80")

build() {
		cmake -Bbuild \
				-S $_pkgname-$pkgver \
				-DCMAKE_BUILD_TYPE=Release \
				-DARGUMENTUM_INSTALL_HEADERONLY=ON \
				-DARGUMENTUM_BUILD_STATIC_LIBS=OFF \
				-DCMAKE_INSTALL_PREFIX=/usr
		cmake --build ./build
}

package() {
		cd build
		DESTDIR="$pkgdir" cmake --install .
}
