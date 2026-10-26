# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-color-scheme
pkgver=6.31.0
pkgrel=1
pkgdesc='Classes to read and interact with KColorScheme'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-color-scheme'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kcolorscheme')
conflicts=('kcolorscheme')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('48d183f95f376d59404fa14811260c1a797b83fecf4050b10f9cf88d0b77f16e')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
