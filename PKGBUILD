# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=4.0
pkgrel=1
pkgdesc="Audio Player"
arch=("x86_64" "aarch64")
url="https://github.com/libcontemporary/thebeat"
license=('GPL3')
depends=('libcontemporary' 'libthefrisbee' 'taglib' 'gstreamer')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
optdepends=('cdrdao: for CD burning')
source=("thebeat"::"https://github.com/vicr123/theBeat/archive/v$pkgver.tar.gz")
sha256sums=('ad49c87d1c529d7e5f73afc9636bb243cfb6b61e5ab30da570e3ff13bf6c77e9')

build() {
	cmake -B build -S "theBeat-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
