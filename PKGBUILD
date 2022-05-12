# Maintainer: Amirabbas Fazelinia <utilyre@protonmail.com>
pkgname="utilyre-st-git"
_reponame="st"
pkgver="0.8.6"
pkgrel="1"
pkgdesc="A simple virtual terminal emulator for X"
arch=("x86_64")
url="https://github.com/utilyre/st.git"
license=("MIT")
depends=("libxft-bgra")
makedepends=("git" "make")
provides=("st")
conflicts=("st" "st-git")
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
