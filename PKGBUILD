# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-breeze
pkgver=6.8.0
pkgrel=1
pkgdesc='Artwork, styles and assets for the Breeze visual style for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-breeze'
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
conflicts=('breeze-cursors')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cc66d45f6830bf502dfb4c82ca7ee9369498a41a677d6dfb6ba860299b325e18')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
