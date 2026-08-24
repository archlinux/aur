# Maintainer: Jérémy Anger <angerj.dev@gmail.com>
pkgname=vpv
pkgver=0.9.1
pkgrel=0
epoch=
pkgdesc="Image viewer (with GDAL and Octave support)"
arch=(x86_64)
url="https://github.com/kidanger/vpv"
license=('GPL3')
groups=()
depends=('sdl2' 'libtiff' 'libpng' 'libjpeg-turbo' 'gdal' 'octave')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://codeberg.org/kidanger/vpv/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('7cb8155c7249a0f714c16b10ed5530c7')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -DUSE_OCTAVE=ON -DUSE_GDAL=ON
	make
}

check() {
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
