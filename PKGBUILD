# Maintainer: threeoh6000 <master@colean.cc>
pkgname="textbar-lua-git"
pkgver="2a1142c709"
pkgrel=1
pkgdesc="Text status bar for X11, lua branch"
arch=("x86_64")
url="https://gitea.itycodes.org/itycodes/textbar"
license=("BSD-3-Clause")
depends=("cairo>=1.17.8"
         "libx11>=1.8.0"
	 "lua>=5.4.0")
makedepends=("gcc>=11.0.0")
source=("https://gitea.itycodes.org/itycodes/textbar/archive/2a1142c709bc7795d800f8c3e80ab9851fa8a166.tar.gz")
sha256sums=("69fe6786b4687c5041e112a0f5be24cbc5fed4bd15ca36f5dfa75d62ba803366")
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
