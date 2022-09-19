# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Librewish <librewish@gmail.com?
# Contributer: Dan Johansen <strit@manjaro.org>

pkgname=greetd-qtgreet
_pkg=QtGreet
pkgver=1.0.0
pkgrel=4
pkgdesc='Qt based greeter for greetd'
arch=('aarch64' 'x86_64')
url="https://gitlab.com/marcusbritanicus/QtGreet"
license=('GPL3')
depends=('qt5-base' 'wlroots' 'qt5-wayland' 'greetd')
makedepends=('cmake' 'extra-cmake-modules')
source=("$pkgname-$pkgver.bz2::$url/-/archive/v$pkgver/QtGreet-v$pkgver.tar.bz2")
sha256sums=('cc309f5d86477e5d616d9e4df4d172bd7860de6ed242b23a6564e1727b837998')

## no im not using that setup.py script

build() {
	cmake \
		-B build \
		-S "$_pkg-v$pkgver/src" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
}
