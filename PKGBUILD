# Maintainer: Akari-chan <`echo YmJlZWRzaTRAYW5vbmFkZHkubWUK | base64 -d`>

pkgname="clpimg-git"
_pkgname=${pkgname%-git}
pkgver=r11.4db6f88
pkgrel=1
pkgdesc="copy images to clipboard using qt backend"

arch=("any")
license=("GPL")
url="https://github.com/MahouShoujoMivutilde/clpimg"

depends=('python-pyqt5')
makedepends=('git')

source=("$pkgname::git+$url.git")
md5sums=("SKIP")

provides=("$_pkgname")
conflicts=("$_pkgname")


pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
