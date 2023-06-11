# Maintainer: Jérémy Anger <angerj.dev@gmail.com>
pkgname=vpv
pkgver=0.8.2
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
source=("https://github.com/kidanger/vpv/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('66d091f32860caad20e89c6eecd75385')
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
