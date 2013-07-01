# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-unikey
pkgver=0.2.1
pkgrel=1
pkgdesc="Fcitx Wrapper for unikey"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7')
optdepends=('qt4: To run the fcitx unikey macro editor')
makedepends=('cmake' 'qt4')
source=("http://download.fcitx-im.org/$pkgname/$pkgname-${pkgver}.tar.xz")
install=fcitx-unikey.install

build(){
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
    make
}

package ()
{
    cd "$srcdir/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}

sha512sums=('8349623c196ec7c4e48e64d07ef551a308f71f2bfc09fcd320bb02854a77370169b94131750dfcf065dd2a9c734c86048f482d0d2f0b210a1834ab77ea3bf1aa')
