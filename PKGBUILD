# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-charts
pkgver=6.31.0
pkgrel=1
pkgdesc='A QtQuick plugin providing high-performance charts'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-quick-charts'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-quick-ui'
)
makedepends=(
	'qt6-shadertools'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kquickcharts')
conflicts=('kquickcharts')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('45687be15c1845c91bbc1be75b3e1123578b2ee3d8fa8da9a9d8e3cf934f4820')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
