# Maintainer: Amirabbas Fazelinia <utilyrel@protonmail.com>
pkgname="utilyre-dmenu-git"
_reponame="dmenu"
pkgver="5.1"
pkgrel="2"
pkgdesc="A generic menu for X patched with allow-color-font, center, border, fuzzymatch, fuzzyhighlight, xresources-alt, and linesbelowprompt-and-fullwidth"
arch=("x86_64")
url="https://github.com/utilyre/dmenu.git"
license=("MIT")
depends=("libxft-bgra")
makedepends=("git" "make")
provides=("stest" "dmenu" "dmenu_run")
conflicts=("dmenu" "dmenu-git")
source=("git+$url")
md5sums=("SKIP")

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
