# Maintainer: Luca CPZ <luca.cpz [at] gmail [dot] com>

_pkgname=lain
pkgname=$_pkgname-git
pkgver=r1771.07cf82e
pkgrel=1
epoch=1
pkgdesc="Layouts, asynchronous widgets and utilities for Awesome WM"
arch=("any")
url="https://github.com/lcpz/$_pkgname"
license=("GPL2")
depends=("awesome")
makedepends=("git")
optdepends=("curl: for IMAP, MPD and weather widgets")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=("SKIP")
source=("git+https://github.com/lcpz/lain.git")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    install -dm755 "$pkgdir/usr/share/lua/5.3/$_pkgname/"{icons,layout,util,widget}
    cp -a {icons,layout,util,widget,LICENSE,README.rst,*.lua} "$pkgdir/usr/share/lua/5.3/$_pkgname"
}
