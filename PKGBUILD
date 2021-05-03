# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui
_pkgname=ytdl-gui
pkgver=2.5
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files."
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('d725f94061819f9366e6a170e9cebd06dd6bf824d180a13976f7b1f9bd8e5754')
conflicts=("youtubedl-gui-beta")
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
