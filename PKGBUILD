# Maintainer: Paco Pascal <me@pacopascal.com>
_pkgname=scb
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="A simple frontend for grepping around source code."
arch=($CARCH)
url='https://github.com/FragmentedCurve/scb/'
license=('BSD')
depends=(ncurses)
makedepends=(git make)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=('git+https://github.com/FragmentedCurve/scb.git')
md5sums=('SKIP')

build() {
    cd "$_pkgname"
    make
}

check() {
    cd "$_pkgname"
    
}

package() {
    cd "$_pkgname"
    mkdir -p "$pkgdir/usr/bin/"
    install scb "$pkgdir/usr/bin/"
    install ssrc "$pkgdir/usr/bin/"
}
