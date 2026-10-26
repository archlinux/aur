# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-qml-bridge
pkgver=6.31.0
pkgrel=1
pkgdesc='Provides integration of QML and SonicDE Frameworks'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-qml-bridge'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-keybind'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
)
makedepends=(
	'doxygen'
	'qt6-shadertools'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kdeclarative')
conflicts=('kdeclarative')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ef004ec9fb7fddbdd35862f107024116aa87bdc4b7a6c4b4b377e9f05abbbda5')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
