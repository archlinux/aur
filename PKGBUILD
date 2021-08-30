# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui
_pkgname=ytdl-gui
pkgver=3.0
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files."
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('93ce39a00b2a66dbdfa7f7be21bee19f3f1ce0ad6f727464d9245e27072785a9')
provides=("youtubedl-gui")
conflicts=("youtubedl-gui")
makedepends=("qt5-quickcontrols"
	     "cmake")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme")

build() {
	cd ${_pkgname}-${pkgver}
	cmake -B build
	make -C build -j`nproc`
}

package() {
	cd ${_pkgname}-${pkgver}
	make -C build DESTDIR="$pkgdir/" install
}
