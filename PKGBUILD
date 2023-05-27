# Maintainer: Calvin Reu <j  dot  calvin  dot  reu at protonmail period com>
# License: MIT
# Repository: https://gitlab.com/calvinreu/kbdmod

pkgname=kbdmod
pkgver=2.0.0
pkgrel=16
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
validpgpkeys=()
pkgdir=/bin

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
	echo -e "${RED}this package has to be installed as root${NC}"
	cd "$pkgname-v$pkgver/build"
	install -Dm 755 kbdmod.bin "$pkgdir/kbdmod"
}
sha256sums=('dc2982387de7d698ac1575bf08a866ece2c9a1d153dd630b9750f806fefe6c0b')
sha256sums=('dc2982387de7d698ac1575bf08a866ece2c9a1d153dd630b9750f806fefe6c0b')
sha256sums=('dc2982387de7d698ac1575bf08a866ece2c9a1d153dd630b9750f806fefe6c0b')
