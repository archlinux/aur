# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-silver-sound-theme
pkgdesc='Ocean Sound Theme for SonicDE'
pkgver=6.8.0
pkgrel=1
arch=('any')
url='https://github.com/Sonic-DE/sonic-silver-sound-theme'
license=('LGPL-2.0-or-later')
depends=()
makedepends=(
	'qt6-base'
	'sonic-frameworks-cmake-modules'
)
provides=('ocean-sound-theme')
conflicts=('ocean-sound-theme')
options=('!debug')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8071bd7a1c4723c95fb0127607341f72f7fc5695ce3ec4e51253a85a9c0a10f2')

build() {
	cmake -B build -S $pkgname-$pkgver
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
