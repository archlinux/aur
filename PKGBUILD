# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=massdilate-git
pkgver=r1
pkgrel=1
pkgdesc="Image denoising utility with temporal averaging and PRNU cancellation"
arch=('x86_64')
url="https://codeberg.org/zynskeyfolf/massdilate"
license=('GPL-3.0-only')
depends=('qt6-base')
makedepends=('git' 'cmake' 'make')
provides=('massdilate')
source=("git+https://codeberg.org/zynskeyfolf/massdilate")
sha256sums=(SKIP)

build() {
	mkdir "massdilate/build"
	cd "massdilate/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make -j4
}

package() {
	cd "massdilate/build"
	make install
}
