# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-icon-themes
pkgver=6.31.0.1
pkgrel=1
pkgdesc='Support for icon themes'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-icon-themes'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-svg'
	'sonic-frameworks-archive'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-settings'
	'sonic-frameworks-widgets-addons'
	'sonic-silver-icons'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('qt6-declarative: QML bindings')
provides=('kiconthemes')
conflicts=('kiconthemes')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('efff90128665a5fe43cab271d68f605d26a354cd492e68a990d25c83be77fc81')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
