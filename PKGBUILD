# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-ui-addons
pkgver=1.13.1
pkgrel=3
pkgdesc='Add-ons for the Sonic Quick UI framework'
url='https://github.com/Sonic-DE/sonic-frameworks-quick-ui-addons'
arch=('x86_64')
license=(
	'GPL-2.0-or-later'
	'LGPL-2.1-or-later'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-multimedia'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-data-models'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-keybind'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-spell-check'
	'sonic-frameworks-svg'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('kirigami-addons')
conflicts=('kirigami-addons')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6a0950b7d3fe75760883577d913aa96d78848676a741cc3fd34f8088228d3f1a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
