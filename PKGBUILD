# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-widgets-addons
pkgver=6.31.0
pkgrel=1
pkgdesc='Addons to QtWidgets'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-widgets-addons'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
)
makedepends=(
	'doxygen'
	'python-build'
	'python-setuptools'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-pyside6'
	'sonic-shiboken6-generator'
)
optdepends=('sonic-pyside6: Python bindings')
provides=('kwidgetsaddons')
conflicts=('kwidgetsaddons')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('23d5bc66ccadf1b599cb73543cc62d6a12f217faed3f9ac0ea45f972f2e40f33')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
