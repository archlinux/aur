# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: gruenfron <https://aur.archlinux.org/account/gruenfron>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=2.5
pkgrel=1
pkgdesc='A video player with focus on 3D and Virtual Reality'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL-3.0-or-later')
depends=('qt6-multimedia' 'qt6-svg' 'qvr')
makedepends=('cmake' 'qt6-tools')
source=(https://bino3d.org/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('3e881b2299ac2922fbb915fcac74aea889e8118e3f1a7f2ffbfbf4ff70b038d0400fee734e6c55a37db416dce77df8b9fdde0d5ed154f7d39ff85a3c45f5aff7'
            'SKIP')
validpgpkeys=('2F61B4828BBA779AECB3F32703A2A4AB1E32FD34')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
