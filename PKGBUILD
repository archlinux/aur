# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-ui-components
pkgver=6.31.0
pkgrel=1
pkgdesc='Document centric plugin system'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-ui-components'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kparts')
conflicts=('kparts')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('10ea1d1b80b52c3245587f3d55969597a737b7578f1b3e2bb1f5242668525098')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
