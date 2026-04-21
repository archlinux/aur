# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=paws-plugins-git
pkgver=r1
pkgrel=1
pkgdesc="PAwS Audio Wrangling Suite - LV2 plugins"
arch=('x86_64')
url="https://zynskey.nekoweb.org/paws"
license=('GPL-3.0-or-later')
groups=('lv2-plugins' 'pro-audio')
depends=('qt5-base')
makedepends=('git' 'cmake' 'make' 'lv2')
replaces=('paws-lv2-git')
provides=('paws-plugins')
source=("git+https://codeberg.org/zynskeyfolf/paws-plugins")
sha256sums=(SKIP)

build() {
	mkdir "paws-plugins/build"
	cd "paws-plugins/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make -j4
}

package() {
	cd "paws-plugins/build"
	make install
}
