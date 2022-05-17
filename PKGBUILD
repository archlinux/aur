# Maintainer: Amirabbas Fazelinia <utilyre@protonmail.com>

pkgname="utilyre-st-git"
_reponame="st"
pkgver="0.8.6"
pkgrel="1"
pkgdesc="A simple virtual terminal emulator for X"
arch=("i686" "x86_64" "armv7h")
url="https://github.com/utilyre/st"
license=("MIT")
depends=("libxft-bgra")
makedepends=("ncurses" "libxext" "git")
provides=("st")
conflicts=("st" "st-git")
source=("git+$url.git")
sha256sums=("SKIP")

build() {
	cd "$_reponame"
	make X11INC="/usr/include/X11" X11LIB="/usr/lib/X11"
}

package() {
	cd "$_reponame"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
