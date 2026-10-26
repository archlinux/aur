# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-quick-desktop-style
pkgver=6.31.0
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-quick-desktop-style'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-spell-check'
)
makedepends=(
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
provides=('qqc2-desktop-style')
conflicts=('qqc2-desktop-style')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f6de96fcdddae6c1d737e6dc4143c89905eb7e48616e1e0114a834ae4d24a1e0')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
