# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=kjv-apocrypha
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Read the Word of God from your terminal (now with apocrypha)"
arch=("any")
url="https://gitlab.com/LukeSmithxyz/kjv"
license=("The Unlicense")
groups=()
depends=("bash" "coreutils" "gawk" "sed" "ncurses" "tar")
makedepends=()
checkdepends=()
optdepends=("less: for better preview")
provides=("kjv")
conflicts=("kjv-git")
replaces=()
backup=()
options=()
source=("git+https://gitlab.com/LukeSmithxyz/kjv.git")
noextract=("git+https://gitlab.com/LukeSmithxyz/kjv.git")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/kjv/"
	git reset --hard "f6e6f639b135414659179b09a5fdec4ad8add40e"
}

package() {
	cd "$srcdir/kjv/"
	mkdir -vp "$pkgdir/usr/local/bin/"
	make install DESTDIR="$pkgdir"
}
