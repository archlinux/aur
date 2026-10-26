# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Mainrainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-modemmanager
pkgver=6.31.0
pkgrel=1
pkgdesc='Qt wrapper for ModemManager DBus API'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-modemmanager'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'modemmanager'
	'qt6-base'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('modemmanager-qt')
conflicts=('modemmanager-qt')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fec4762013ea060bbcd2d9d57e673b96ff3de415994d45a7912fae313d7aaf83')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
