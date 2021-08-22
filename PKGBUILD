# Maintainer: Thomas Lübking <thomas.luebking at gmail>

pkgname=sqriptor-git
_gitname=sqriptor
pkgver=r62.a658771
pkgrel=1
pkgdesc="QScintilla based text editor"
arch=(i686 x86_64)
url="https://github.com/luebking/sqriptor"
license=(GPL)
depends=(qt5-base qscintilla-qt5)
makedepends=(git)
provides=(sqriptor)
conflicts=(sqriptor)
source=("git+https://github.com/luebking/sqriptor.git")
sha256sums=("SKIP")

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_gitname}"
    qmake-qt5
    make
}

package() {
    cd "${_gitname}"
    install -Dm755 sqriptor -t "${pkgdir}/usr/bin"
}