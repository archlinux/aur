# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-quick-image-editor
pkgver=0.7.0.1
pkgrel=3
pkgdesc='QML image editing components with SonicDE defaults'
license=('LGPL-2.1-or-later')
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-quick-image-editor'
depends=(
	'glibc'
	'highway'
	'libgcc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
)
makedepends=(
	'qt6-shadertools'
	'sonic-frameworks-cmake-modules'
)
provides=('kquickimageeditor')
conflicts=('kquickimageeditor')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ac92df06d7c938783d795de793c68d0e3baf7567977b46afa7dcc0070857dc54')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
