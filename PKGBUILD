# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thepage
pkgver=2.0
pkgrel=0
pkgdesc="Document Viewer using poppler"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thepage"
license=('GPL3')
depends=('libcontemporary' 'poppler-qt6')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("thepage"::"https://github.com/theCheeseboard/thepage/archive/v$pkgver.tar.gz")
sha256sums=('f974e766cb57eaac442714b76a96d279e49603cfde5e607512f8f70d4f675a3a')

build() {
	cmake -B build -S "thePage-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
