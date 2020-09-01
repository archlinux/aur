# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantpacman
pkgname=$_pkgname
pkgver=202008061239
pkgrel=1
pkgdesc="simple pacman GUI for instantOS"
url="https://github.com/instantOS/instantpacman"
arch=('any')
license=('MIT')
depends=('instantmenu')
makedepends=('git')
provides=(instantpacman)
conflicts=(instantpacman)
source=("$_pkgname::git+https://github.com/instantOS/instantpacman.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p "${pkgdir}/usr/bin"

    for i in ./*.sh; do
        echo "processing $i"
        chmod 755 "$i"
        mv "$i" "${i%.sh}"
        mv "${i%.sh}" "${pkgdir}/usr/bin/"
    done

}
