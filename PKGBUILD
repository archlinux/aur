# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui-beta
pkgver=2.0
pkgrel=3
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files. - Beta Branch"
source=("git+https://github.com/JaGoLi/ytdl-gui#branch=beta")
install="youtubedl-gui.install"
md5sums=('SKIP')
conflicts=("youtubedl-gui")
makedepends=("git"
	     "qt5-quickcontrols")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme"
	 "gtk-update-icon-cache")

build() {
	cd ytdl-gui
	make build
}

package() {
	cd ytdl-gui
	make DESTDIR="$pkgdir/" install
}
