# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-silver
pkgver=6.8.0.1
pkgrel=1
pkgdesc='Artwork, styles and assets for the Silver visual style for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-silver'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-svg'
	'sonic-decoration'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-qt-integration'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-silver-icons'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=(
	'breeze'
	'sonic-silver-theme'
)
conflicts=(
	'breeze'
	'sonic-silver-theme'
)
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5d66e71b0de0d3a264f3ca86bafeb99d759a40f13ed7a3531d2cceec7dfbd947')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
