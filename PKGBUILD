# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-text-codec
pkgver=6.31.0
pkgrel=1
pkgdesc='Provide a collection of methods to manipulate strings using various encodings'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-text-codec'
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
	'gperf'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('kcodecs')
conflicts=('kcodecs')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4817963dbc7350a7902fd2af46583b8ce3397499e09913dc90a39e23aa069b2e')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
