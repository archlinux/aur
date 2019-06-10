# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=img-matrix-git
pkgver=r5.e70734d
pkgrel=1
pkgdesc="Script that generates tiles from images and combines them in a html file."
arch=("any")
url="https://gitlab.com/Scrumplex/img-matrix"
license=("GPL3")

depends=("bash" "imagemagick")
makedepends=("git")
provides=("img-matrix")
conflicts=("img-matrix")

source=("git+https://gitlab.com/Scrumplex/img-matrix.git")
sha512sums=('SKIP')


pkgver() {
    cd "$srcdir/img-matrix"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/img-matrix"

    install -v -m755 -D "img-matrix" "$pkgdir/usr/bin/img-matrix"
}
