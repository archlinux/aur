# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui
pkgver=1.6
pkgrel=2
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files."
install="youtubedl-gui.install"
makedepends=("git"
	     "qt5-quickcontrols")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme"
	 "gtk-update-icon-cache")

prepare() {
	git clone https://github.com/JaGoLi/ytdl-gui.git
}

build() {
	cd ytdl-gui
	make build
}

package() {
	cd ytdl-gui
	make DESTDIR="$pkgdir/" install
}
