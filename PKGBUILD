# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-decoration
pkgver=6.8.0
pkgrel=1
pkgdesc='Plugin based library to create window decorations'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-decoration'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-internationalization'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('kdecoration')
conflicts=('kdecoration')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('67b1becbc7497650251f08b72f5323043abe678ae0756bfd5101ac58a8ed9d52')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
