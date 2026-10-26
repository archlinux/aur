# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-workspace-wallpapers
pkgver=6.8.0
pkgrel=1
pkgdesc='Additional wallpapers for the Sonic Workspace'
arch=('any')
url='https://github.com/Sonic-DE/sonic-workspace-wallpapers'
license=('LGPL')
makedepends=(
	'qt6-base'
	'sonic-frameworks-cmake-modules'
)
options=('!debug')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43d598d82b51fb6fec062ee4576a7582302381008fff4ecaf2ba31f1f4657981')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
