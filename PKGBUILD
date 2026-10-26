# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-text-widgets
pkgver=6.31.0
pkgrel=1
pkgdesc='Advanced text editing widgets'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-text-widgets'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-speech'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
	'sonic-frameworks-spell-check'
	'sonic-frameworks-widgets-addons'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('ktextwidgets')
conflicts=('ktextwidgets')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a93dae591de1a21ea6b3a71b6dd1e58cc49cb02a9116e92d3f42c5bfb38a7e08')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
