# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: csslayer <wengxt AT gmail com>

pkgname=fcitx-kkc
pkgver=0.1.0
pkgrel=1
pkgdesc="Fcitx Wrapper for libkkc"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.8' 'libkkc>=0.2.3' 'libkkc-data' 'skk-jisyo' 'fcitx-qt4')
makedepends=('cmake')
install=$pkgname.install
source=(http://download.fcitx-im.org/${pkgname}/${pkgname}-${pkgver}.tar.xz)

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

md5sums=('c86a48f9e7a1e9de16b0919e5413fc9d')
