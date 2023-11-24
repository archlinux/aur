# Maintainer: balaraz <balaraz@tuta.io>

pkgname=argumentum
pkgver=0.3.2
pkgrel=1
pkgdesc="C++ command line parsing library"
url="https://github.com/mmahnic/argumentum/"
license=(MPL2)
groups=(libraries)
arch=(x86_64)
makedepends=(cmake make)
optdepends=(cmake)
provides=(libargumentum.a)
source=("https://github.com/mmahnic/argumentum/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("3db84bfbd4d459b3128f449de9b88ae1e222cb62a4ba95dc4db6eb48a2af9f80")

build() {
		cmake -Bbuild \
				-S $pkgname-$pkgver \
				-DCMAKE_BUILD_TYPE=Release \
				-DCMAKE_INSTALL_PREFIX=/usr
		cmake --build ./build
}

package() {
		cd $srcdir/build
		DESTDIR="$pkgdir" cmake --install .
}
