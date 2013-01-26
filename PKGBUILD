# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=fcitx-m17n
pkgver=0.2.0
pkgrel=1
pkgdesc="Fcitx Wrapper for m17n."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx>=4.2.7' 'm17n-lib')
makedepends=('cmake')
source=(http://fcitx.googlecode.com/files/${pkgname}-${pkgver}.tar.xz)

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    mkdir -p build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
md5sums=('6740e3a983c3e7647be3f082abdfc57c')
