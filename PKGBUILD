# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: gruenfron <https://aur.archlinux.org/account/gruenfron>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=2.3
pkgrel=1
pkgdesc='A video player with focus on 3D and Virtual Reality'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL-3.0-or-later')
depends=('qt6-multimedia' 'qt6-svg' 'qvr')
makedepends=('cmake' 'qt6-tools')
source=(https://bino3d.org/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('9750deb7e777237c87d3bd1e7d5411b23b55c4c3bac5361848effb59c3253fb4f9355fddbae62c922026318c349657a7fdfecdf4041cd756a92f0440c1e29f4c'
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
