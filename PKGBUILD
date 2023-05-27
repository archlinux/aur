# Maintainer: Calvin Reu <j  dot  calvin  dot  reu at protonmail period com>
# License: MIT
# Repository: https://gitlab.com/calvinreu/kbdmod

pkgname=kbdmod
pkgver=2.0.0
pkgrel=13
epoch=
pkgdesc="modify your keyboard functionality with multi functions per key"
arch=('any')
url="https://gitlab.com/calvinreu/$pkgname"
license=('MIT')
groups=()
depends=(libevdev yaml-cpp interception-tools)
makedepends=(cmake)
checkdepends=(make)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/calvinreu/$pkgname/-/archive/v$pkgver/kbdmod-v$pkgver.tar.gz")
noextract=()
sha256sums=(b5d564eccbc1a63db85fbb98cb4335c5d5c96b81521a1c080d79a3068f397d04)
validpgpkeys=()

build() {
	cd "$pkgname-v$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -Dversion="$pkgver"
	make -j 8
}

check() {
	cd "$pkgname-v$pkgver/build"
	make -k cmake_check_build_system
}

package() {
	cd "$pkgname-v$pkgver/build"
	cp kbdmod.bin "$pkgdir/kbdmod"
}
sha256sums=('0770ae41946e4a36c29008fd8263faca189796a85a5c08fd356c0476b9417412')
sha256sums=('dc2982387de7d698ac1575bf08a866ece2c9a1d153dd630b9750f806fefe6c0b')
