# Maintainer: Lukas Spies <lukas_at_photoqt_dot_org>

_pkgname=imgurqt
pkgname=imgurqt-git
pkgrel=1
pkgver=14.f87671e
pkgdesc="Console application implementing basic commands of imgur.com APIv3"
arch=("i686" "x86_64")
url="https://gitlab.com/luspi/imgurqt"
provides=("imgurqt")
conflicts=("imgurqt")
license=("GPL2")
depends=("qt5-base")
makedepends=("git" "cmake")
source=("git+https://gitlab.com/luspi/imgurqt.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    echo "$(git rev-list --all --count).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	cmake .
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -D imgurqt $pkgdir/usr/bin/imgurqt
}
