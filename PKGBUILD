# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall-git
_gitname=chwall
_upver=0.5.5
pkgver=0.5.5r315.01087a9
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick" "git")
conflicts=("chwall")
source=("git+https://git.umaneti.net/${_gitname}#branch=v${_upver}-dev")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${_gitname}"
    printf "%sr%s.%s" "$_upver" "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_gitname}"
    make dist DESTDIR=$pkgdir
}
