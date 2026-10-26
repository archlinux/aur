# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-silver-style
pkgver=6.8.0
pkgrel=1
pkgdesc='Silver Qt Quick Controls style for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-quick-silver-style'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('qqc2-breeze-style')
conflicts=('qqc2-breeze-style')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ba70c67b6c0465958edc3ff19e741371d763ac2c322b6347d201838de40fd633')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
