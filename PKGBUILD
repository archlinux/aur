# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-oxygen-sounds
pkgdesc='The Oxygen Sound Theme'
pkgver=6.8.0
pkgrel=1
arch=('any')
url='https://github.com/Sonic-DE/sonic-oxygen-sounds'
license=('LGPL-2.0-or-later')
depends=()
makedepends=(
	'qt6-base'
	'sonic-frameworks-cmake-modules'
)
provides=('oxygen-sounds')
conflicts=('oxygen-sounds')
options=('!debug')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b3efc535da0d1061c245051606da0c301581c4758df6ffd008e8ae44e0f9ede9')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
