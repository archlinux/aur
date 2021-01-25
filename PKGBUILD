# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui
_pkgname=ytdl-gui
pkgver=1.9
pkgrel=2
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files."
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
install="youtubedl-gui.install"
sha256sums=('16961b0c93defd442fc37aac8e98d62af71e6a654b3de6483a9917f1480bea24')
conflicts=("youtubedl-gui-beta")
makedepends=("git"
	     "qt5-quickcontrols")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme"
	 "gtk-update-icon-cache")

build() {
	cd ${_pkgname}-${pkgver}
	make build
}

package() {
	cd ${_pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
}
