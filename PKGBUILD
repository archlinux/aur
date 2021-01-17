# Maintainer: Jason Goulet-Lipman <jason.gouletlipman@gmail.com>
pkgname=youtubedl-gui-beta
pkgver=VERSION
pkgrel=1
arch=('x86_64')
license=('GPL3')
pkgdesc="Download Youtube videos to local audio or video files. - Beta Branch"
source=("git+https://github.com/JaGoLi/ytdl-gui#branch=beta")
install="youtubedl-gui.install"
md5sums=('SKIP')
makedepends=("git")
depends=("youtube-dl"
	 "qt5-base"
	 "ffmpeg"
	 "hicolor-icon-theme"
	 "gtk-update-icon-cache")

pkgver() {
	cd ytdl-gui
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ytdl-gui
	make build
}

package() {
	cd ytdl-gui
	make DESTDIR="$pkgdir/" install
}
