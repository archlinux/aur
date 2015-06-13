# Maintainer: Bernd Amend <bernd.amend+extension_system gmail com>

pkgname=extension_system
pkgver=7
pkgrel=1
pkgdesc="simple and powerful extension_system"
url="https://bitbucket.org/tptb/extension_system"
arch=(i686 x86_64 armel armv6h)
license=('BSL')
source=("https://bitbucket.org/tptb/extension_system/get/v${pkgver}.tar.bz2")
sha512sums=('759968b9d192cdcfb243a4e198ed07a69194e6d7e116eae1887dbc38a8a69cf6825da96f6e3eaa02e4e4df9417114dfed7418ee396b119b7471c03960e219c58')

build() {
	pwd
	cd tptb-extension_system-*
	mkdir build
	cd build
	cmake	-DCMAKE_BUILD_TYPE=Release \
			-DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
			..
	make
}

package() {
	cd tptb-extension_system-*/build
	make install
}
