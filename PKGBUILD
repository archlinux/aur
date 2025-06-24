# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=paws-lv2-git
pkgver=r1
pkgrel=1
pkgdesc="A few niche audio effects and synthesizers"
arch=('x86_64')
url="https://zynskey.nekoweb.org/paws"
license=('GPL-3.0-or-later')
depends=('lv2')
makedepends=('git' 'cmake' 'make' 'lv2')
source=("git+https://codeberg.org/zynskeyfolf/paws-lv2")
sha256sums=(SKIP)

build() {
	mkdir "paws-lv2/build"
	cd "paws-lv2/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make -j4
}

package() {
	cd "paws-lv2/build"
	make install
}
