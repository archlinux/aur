# Maintainer: Amirabbas Fazelinia <utilyre@protonmail.com>
pkgname="utilyre-herbe-git"
_reponame="herbe"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="A daemon-less notifications without D-Bus patched with vertical-stacking and xresources"
arch=("x86_64")
url="https://github.com/utilyre/herbe.git"
license=("MIT")
depends=("libxft-bgra")
makedepends=("git" "make")
provides=("herbe")
conflicts=("herbe" "herbe-git")
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
