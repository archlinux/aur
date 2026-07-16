# Maintainer: MeaTLoTioN <ml@erb.pw>
pkgname=evolution-expand-folders
pkgver=1.0.0
pkgrel=1
pkgdesc="Evolution plugin adding expand/collapse for the mail folder tree, via context menu and keyboard shortcuts"
arch=('x86_64' 'aarch64')
url="https://github.com/christiansacks/evolution-expand-folders"
license=('LGPL-2.1-or-later')
depends=('evolution')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e4f533c651e259ad3abcbad7feb2bedb36e0b9f855f3910057146094930e1b21')

build() {
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
