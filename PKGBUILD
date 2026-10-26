# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-via
pkgver=6.31.0
pkgrel=1
pkgdesc='Desktop keyboard configurator for QMK keyboards'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-via'
license=(
	'BSD-2-Clause'
	'LGPL-2.1-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'hidapi'
	'libstdc++'
	'qt6-base'
)
makedepends=('sonic-frameworks-cmake-modules')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('981c6231fc97c2c5466fefee3a76558eea6ae787d18548cd06e88a577ac47771')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
