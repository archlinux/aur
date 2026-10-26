# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-addons-downloader
pkgver=6.31.0
pkgrel=1
pkgdesc='Support for downloading application assets from the network'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-addons-downloader'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-archive'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-feeds'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-open-collab'
	'sonic-frameworks-package'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-widgets-addons'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('knewstuff')
conflicts=('knewstuff')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ea5a17622392b8d551a1948d400f82d78aaa018b030e6b1b7351605eae1de257')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
