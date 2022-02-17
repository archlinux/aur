# Maintainer: Emanuele Grasso <graele84@gmail.com>

pkgname=tuxboard-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Simple drawing and writing application for Linux to be used with pen tablets"
arch=("i686" "x86_64")
url="https://gitlab.com/graele84/tuxboard"
license=("AGPLv3")
depends=("qt5-base")
makedepends=("qt5-base" "qt5-svg")
conflicts=("tuxboard-git")
source=("git+https://gitlab.com/graele84/tuxboard.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/tuxboard"
    mkdir -p "$srcdir/tuxboard/build"
    cd "$srcdir/tuxboard/build"
    qmake-qt5 "$srcdir/tuxboard/src/tuxBoard.pro" -spec linux-g++
    make -j $(nproc)
}

package() {
    # cd "$srcdir/tuxboard"
    mkdir -p "${pkgdir}/usr/bin"
    cp "$srcdir/tuxboard/build/tuxBoard" "${pkgdir}/usr/bin/tuxboard"
}
