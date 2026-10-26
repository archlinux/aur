# Maintainer: callmetango
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-pulseaudio-library
pkgver=1.8.1
pkgrel=1
pkgdesc='Qt bindings for libpulse'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-pulseaudio-library'
license=(
	'LGPL-2.1-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libpulse'
	'libstdc++'
	'qt6-base'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('pulseaudio-qt')
conflicts=('pulseaudio-qt')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('846740f81b8e33de1fe03f1f31fb1c22bad1690075058f065dfd4108cd323e68')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
