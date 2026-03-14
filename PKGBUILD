# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: gruenfron <https://aur.archlinux.org/account/gruenfron>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bino
pkgver=2.7
pkgrel=1
pkgdesc='A video player with focus on 3D and Virtual Reality'
arch=('x86_64')
url='https://bino3d.org/'
license=('GPL-3.0-or-later')
depends=('qt6-multimedia' 'qt6-svg' 'qvr')
makedepends=('cmake' 'qt6-tools')
source=(https://bino3d.org/releases/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('45ff802468945781ed0e0ab35e1582cda3aa9e7ad3a8cbac643a7dfec3bc54f1cdeed3adff255fa2c9506c69fc15c25de3bc6ea395b5779d6c9ee36e98e5b134'
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
