
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thecalculator
pkgver=3.0
pkgrel=1
pkgdesc="Calculator"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thecalculator"
license=('GPL3')
depends=('libcontemporary')
makedepends=('bison' 'flex' 'git' 'qt6-tools' 'cmake' 'clang')
source=("thecalculator"::"https://github.com/theCheeseboard/thecalculator/archive/v$pkgver.tar.gz")
sha256sums=('c1a34775e3e056e9b6bbab4ed8539d23cbfac370bdf299e32851b1fdb98f1a5f')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
