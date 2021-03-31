# Maintainer: Luca CPZ <luca.cpz [at] gmail [dot] com>

_pkgname=lain
pkgname=$_pkgname-git
pkgcom=1759
pkgsha=5882000
pkgver=$pkgcom.$pkgsha
pkgrel=1
pkgdesc="Layouts, asynchronous widgets and utilities for Awesome WM"
arch=("any")
url="https://github.com/lcpz/$_pkgname"
license=("GPL2")
depends=("awesome")
optdepends=("curl: for IMAP, MPD and weather widgets")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=("SKIP")
source=("$_pkgname-${pkgver}.zip::https://github.com/lcpz/$_pkgname/archive/$pkgsha.zip")

prepare() {
    rm -fr "$_pkgname/$_pkgname-$pkgsha"*
    mv "$_pkgname-$pkgsha"* $_pkgname
}

package() {
    cd $_pkgname
    install -dm755 "$pkgdir/usr/share/lua/5.3/$_pkgname/"{icons,layout,util,widget}
    cp -a {icons,layout,util,widget,LICENSE,README.rst,*.lua} "$pkgdir/usr/share/lua/5.3/$_pkgname"
}
