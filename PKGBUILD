# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: gruenfron <https://aur.archlinux.org/account/gruenfron>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=2.1
pkgrel=1
pkgdesc='A video player with focus on 3D and Virtual Reality'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'qvr')
makedepends=('cmake' 'qt6-tools')
source=(https://bino3d.org/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('6a7e22a311bdfce4fbfb4b0dedebc5524ea08af773d14e6ca235c3693c7aacea40b1941302e2a9c20564a0783b4728b38db9f6cbb727289df668d50dbba0180d'
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
