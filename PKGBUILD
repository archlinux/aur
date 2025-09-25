# Maintainer: ZynskeyFolf <djpixus at gmail dot com>
pkgname=jaqalmixer-git
pkgver=r1
pkgrel=1
pkgdesc="Soundcard configuration tool for pro-audio use, made in Qt. Includes alsamixer's functionality."
arch=('x86_64')
url="https://codeberg.org/zynskeyfolf/JaqalMixer"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'alsa-lib')
makedepends=('git' 'cmake' 'make' 'qt6-base' 'alsa-lib')
optdepends=('alsa-utils: for saving settings persistently')
source=("git+https://codeberg.org/zynskeyfolf/JaqalMixer")
sha256sums=(SKIP)

build() {
	mkdir "JaqalMixer/build"
	cd "JaqalMixer/build"
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr
	make
}

package() {
	cd "JaqalMixer/build"
	make install
}
