# Maintainer: threeoh6000 <master@colean.cc>
pkgname="textbar-git"
pkgver="db4159c546"
pkgrel=1
pkgdesc="Text status bar for X11"
arch=("x86_64")
url="https://gitea.itycodes.org/itycodes/textbar"
license=("BSD-3-Clause")
depends=("cairo>=1.17.8"
         "libx11>=1.8.0")
makedepends=("gcc>=11.0.0")
source=("https://gitea.itycodes.org/itycodes/textbar/archive/db4159c5469d763c3b8c901d2bd0559a9d03129a.tar.gz")
sha256sums=("b2d5b985a697dfbf09059084d030ac8ccf6b1a92791f7877bc9ba109d0a8e43b")
provides=("textbar")
conflicts=("textbar")

build() {
	cd "textbar"
	./compile.sh
}

package() {
	cd "textbar"
	mkdir -p "$pkgdir/usr/bin"
	cp main.o "$pkgdir/usr/bin/textbar"
}
