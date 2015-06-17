# Maintainer: notfoss <AT> gmx.com

pkgname="dex-editor-git"
pkgver="1889.b1f65ce"
pkgrel="1"
pkgdesc="A small and lightweight command line based text editor."
arch=("i686" "x86_64")
url="http://github.com/tihirvon/dex"
license=("GPL2")
depends=("glibc" "ncurses")
makedepends=("git")
source=("$pkgname"::"git+https://github.com/tihirvon/dex.git")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    # use the total number of commits + SHA-1 (first 7 characters) of the last commit
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    make prefix=/usr DESTDIR="$pkgdir"
}

package() {
    cd "$pkgname"
    make prefix=/usr DESTDIR="$pkgdir" install
}
