# Maintainer: Luca CPZ <luca.cpz [at] gmail [dot] com>

_pkgname=awesome-freedesktop
pkgname=$_pkgname-git
pkgver=r117.ac9de0e
pkgrel=1
epoch=1
pkgdesc="Freedesktop.org compliant desktop entries and menu for Awesome WM"
arch=("any")
url="https://github.com/lcpz/$_pkgname"
license=("GPL2")
depends=("awesome")
makedepends=("git")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=("SKIP")
source=("git+https://github.com/lcpz/awesome-freedesktop.git")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 "$pkgdir"/usr/share/lua/5.3/${_pkgname##*-}
    install -m644 {LICENSE,README.rst,*.lua} "$pkgdir"/usr/share/lua/5.3/${_pkgname##*-}
}
