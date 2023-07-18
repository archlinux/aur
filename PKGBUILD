# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thepage
pkgver=2.0.1
pkgrel=1
pkgdesc="Document Viewer using poppler"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thepage"
license=('GPL3')
depends=('libcontemporary' 'poppler-qt6')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("thepage-$pkgver"::"https://github.com/theCheeseboard/thepage/archive/v$pkgver.tar.gz")
sha256sums=('e010d58e50db25ed33ca56e45fc164226772a5383ecf0b271e4bb9fb2cc08fe0')

build() {
	cmake -B build -S "thePage-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
