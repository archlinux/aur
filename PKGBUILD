# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-unikey
pkgver=0.1.1
pkgrel=3
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.3')
optdepends=('qt: To run the fcitx unikey macro editor')
makedepends=('cmake' 'intltool' 'qt')
source=("http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz")
install=fcitx-unikey.install

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    rm -rf build
    mkdir build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
md5sums=('91dc7bd6991df3c975a0b51a246836bf')
