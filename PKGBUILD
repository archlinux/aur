# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>

pkgname=simple_snake
pkgver=1.0
pkgrel=3
pkgdesc="A simple Snake game, written on C++ & SFML"
arch=( "any" )
url="https://github.com/KonstantinProgger/Tag-Puzzle"
license=( "Apache License 2.0" )
makedepends=( 'cmake' 'sfml' )
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/KonstantIMP/Snake/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fc7cddc9f483c83e45f9b6b86bcae1905f3954e96c62d4c9f623fde896a1f4b3')

build() {
	cd Snake-1.0
	cmake CMakeLists.txt
	make all
}

package() {
	cd Snake-1.0
	make DESTDIR="${pkgdir}/" install
}
