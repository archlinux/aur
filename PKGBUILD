# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-unikey
pkgver=0.2.0
pkgrel=2
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7')
optdepends=('qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'qt4')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")
install=fcitx-unikey.install

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
md5sums=('f1ffd6c8439e4d277eace994052d91da')
