# Maintainer: Luca CPZ <luca.cpz [at] gmail [dot] com>

_pkgname=awesome-freedesktop
pkgname=$_pkgname-git
pkgcom=105
pkgsha=6951b09
pkgver=$pkgcom.$pkgsha
pkgrel=2
pkgdesc="Freedesktop.org menu and desktop icons support for Awesome WM"
arch=("any")
url="https://github.com/lcpz/$_pkgname"
license=("GPL2")
depends=("awesome")
provides=("$_pkgname")
conflicts=("$_pkgname")
sha256sums=("SKIP")
source=("$_pkgname-${pkgver}.zip::https://github.com/lcpz/$_pkgname/archive/$pkgsha.zip")

prepare() {
    mv "$_pkgname-$pkgsha"* $_pkgname
}

package() {
    install -dm755 "$pkgdir/usr/share/lua/5.3/$_pkgname/"
    install -m644 $_pkgname/{LICENSE,README.rst,*.lua} "$pkgdir/usr/share/lua/5.3/$_pkgname"
}
