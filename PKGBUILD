# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui
_pkgname=ytdl-gui
pkgver=2.0
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files."
source=("https://github.com/JaGoLi/$_pkgname/archive/$pkgver.tar.gz")
install="youtubedl-gui.install"
sha256sums=('59c60fc76344f8ef218fdda71818c6ec045e19964be507f265223db0b7f08b4e')
conflicts=("youtubedl-gui-beta")
makedepends=("qt5-quickcontrols")
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
