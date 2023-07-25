pkgname=qt6pas
_lazarus_tag=3_0_RC1
pkgver=6.2.6
pkgrel=1
pkgdesc='Free Pascal Qt 6 binding library updated by lazarus IDE'
arch=('x86_64')
url='https://gitlab.com/freepascal.org/lazarus/lazarus/-/tree/main/lcl/interfaces/qt6/cbindings'
license=('LGPL3')
depends=('qt6-base')
options=(libtool staticlibs)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('b8597da154c0da2a9f3223f1987adc99433d5a82fcbe58393d97c4809eb5b183ce27d38bb76410448e9ce67654754d849597db433f310ba49efc45395208cc8c')

build() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    qmake6
    make
}

package() {
    cd "lazarus-lazarus_${_lazarus_tag}/lcl/interfaces/qt6/cbindings"
    make INSTALL_ROOT="$pkgdir" install
}
