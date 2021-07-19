# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall-git
_gitname=chwall
pkgver=v0.5.7.r0.g9630456
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.umaneti.net/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick" "git")
conflicts=("chwall")
source=("git+https://git.umaneti.net/${_gitname}")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${_gitname}"
    make dist DESTDIR=$pkgdir
}
