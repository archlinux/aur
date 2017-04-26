# Maintainer: Guillermo Ramos <0xwille at gmail dot com>

_npmname=elm-oracle
pkgname=elm-oracle
pkgver=1.1.1
pkgrel=1
pkgdesc="Elm Oracle intends to be a standalone program that can be used by all editor plugins to query information about a project's source code"
arch=(any)
url="https://github.com/ElmCast/elm-oracle"
license=('BSD3')
options=(!strip)
noextract=($_npmname-$pkgver.tgz)
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
md5sums=("034451ea1a50d72bd4c96b28ef68279f")
sha256sums=("627ea0ef226f02ffbb3079f0c7c7cef33dc837700faa0d2a8d61141094a323c6")

makedepends=(npm)
depends=(nodejs)
optdepends=()


package() {
    cd $srcdir
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p $_npmdir
    cd $_npmdir
    npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
