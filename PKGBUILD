# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-settings-utils
pkgver=6.31.0
pkgrel=1
pkgdesc='Utilities for interacting with the Sonic configuration system'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-settings-utils'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-views'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-xml-gui'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kcmutils')
conflicts=('kcmutils')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e682d1e3ce25ac66d991161afa319b24b5bda413a20050c8efd76a61625653ef')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
