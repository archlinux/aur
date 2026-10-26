# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-feeds
pkgver=6.31.0
pkgrel=1
pkgdesc='RSS/Atom parser library'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-feeds'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-text-codec'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('syndication')
conflicts=('syndication')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ff56f827104d0c05f037f8b55123791c4c70fa65785dfcff7256f75a6bdde443')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
