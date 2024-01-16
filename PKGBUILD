# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=thebeat
pkgver=4.1
pkgrel=1
pkgdesc="Audio Player"
arch=("x86_64" "aarch64")
url="https://github.com/libcontemporary/thebeat"
license=('GPL3')
depends=('libcontemporary' 'libthefrisbee' 'taglib' 'gstreamer')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
optdepends=('cdrdao: for CD burning')
source=("thebeat-$pkgver"::"https://github.com/vicr123/theBeat/archive/v$pkgver.tar.gz")
sha256sums=('319e0e71fb6cf185cace7f7167d20c1661cc8a29d4092d7741cbbd2016d5ae2c')

build() {
	cmake -B build -S "theBeat-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
